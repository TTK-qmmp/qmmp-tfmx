#include "decodertfmxfactory.h"
#include "tfmxhelper.h"
#include "decoder_tfmx.h"

#include <QMessageBox>

bool DecoderTFMXFactory::canDecode(QIODevice *input) const
{
    char buf[9];
    if(input->peek(buf, 9) != 9)
        return false;
    return !memcmp(buf, "TFMXSONG", 8) || !memcmp(buf, "TFMX-MOD", 8) || !memcmp(buf, "TFMX ", 5) ||
           !memcmp(buf, "TFMX-SONG", 9) || !memcmp(buf, "TFMX_SONG", 9);
}

DecoderProperties DecoderTFMXFactory::properties() const
{
    DecoderProperties properties;
    properties.name = tr("TFMX Plugin");
    properties.shortName = "tfmx";
    properties.filters << TFMXHelper::filters();
    properties.description = "Final Music System Tracker Module File";
    properties.protocols << "file" << "tfmx";
    properties.noInput = true;
    properties.hasAbout = true;
    return properties;
}

Decoder *DecoderTFMXFactory::create(const QString &path, QIODevice *input)
{
    Q_UNUSED(input);
    return new DecoderTFMX(path);
}

QList<TrackInfo*> DecoderTFMXFactory::createPlayList(const QString &path, TrackInfo::Parts parts, QStringList *ignoredPaths)
{
    if(path.contains("://")) //is it one track?
    {
        QString filePath = path;
        filePath.remove("tfmx://");
        filePath.remove(RegularExpression("#\\d+$"));

        const int track = path.section("#", -1).toInt();
        QList<TrackInfo*> playlist = createPlayList(filePath, parts, ignoredPaths);
        if(playlist.isEmpty() || track <= 0 || track > playlist.count())
        {
            qDeleteAll(playlist);
            playlist.clear();
            return playlist;
        }

        TrackInfo *info = playlist.takeAt(track - 1);
        qDeleteAll(playlist);
        playlist.clear();
        return playlist << info;
    }
    else
    {
        if(ignoredPaths)
        {
            ignoredPaths->push_back(path);
        }
    }

    TFMXHelper helper(path);
    if(!helper.initialize())
    {
        qWarning("DecoderTFMXFactory: unable to open file");
        return QList<TrackInfo*>();
    }
    return helper.createPlayList(parts);
}

MetaDataModel* DecoderTFMXFactory::createMetaDataModel(const QString &path, bool readOnly)
{
    Q_UNUSED(path);
    Q_UNUSED(readOnly);
    return nullptr;
}

void DecoderTFMXFactory::showSettings(QWidget *parent)
{
    Q_UNUSED(parent);
}

void DecoderTFMXFactory::showAbout(QWidget *parent)
{
    QMessageBox::about(parent, tr("About TFMX Reader Plugin"),
                       tr("Qmmp TFMX Reader Plugin") + "\n" +
                       tr("Written by: Greedysky <greedysky@163.com>"));
}

QString DecoderTFMXFactory::translation() const
{
    return QString();
}
