package rs.onako2;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class Schematic {
    public static void downloadSchematics() {
        String fileURL = "https://github.com/Onako2/juwa-schematics/archive/refs/heads/main.zip";
        String savePath = "schematics/schematics.zip";

        try

        {
            URL url = new URL(fileURL);
            InputStream inputStream = url.openStream();
            FileOutputStream outputStream = new FileOutputStream(savePath);

            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            outputStream.close();
            inputStream.close();

            
        } catch (IOException e) {
            e.printStackTrace();
            
        }
      }


    public static void unzipSchematics () {
        String zipFilePath = "schematics/schematics.zip";
        String outputFolder = "schematics";

        try {
            FileInputStream fis = new FileInputStream(zipFilePath);
            ZipInputStream zis = new ZipInputStream(fis);
            byte[] buffer = new byte[1024];

            ZipEntry zipEntry = zis.getNextEntry();
            while (zipEntry != null) {
                String entryName = zipEntry.getName();
                File newFile = new File(outputFolder + File.separator + entryName);

                if (zipEntry.isDirectory()) {
                    newFile.mkdirs();
                } else {
                    FileOutputStream fos = new FileOutputStream(newFile);
                    int len;
                    while ((len = zis.read(buffer)) > 0) {
                        fos.write(buffer, 0, len);
                    }
                    fos.close();
                }
                zis.closeEntry();
                zipEntry = zis.getNextEntry();
            }
            zis.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
