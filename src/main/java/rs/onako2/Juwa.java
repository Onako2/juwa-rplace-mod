package rs.onako2;

import net.fabricmc.api.ModInitializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionException;


public class Juwa implements ModInitializer {
    public static final Logger LOGGER = LoggerFactory.getLogger("juwa-place");

    @Override
    public void onInitialize() {
        CompletableFuture.runAsync(() -> {
            LOGGER.info("Updating schematics");
            try {
                Schematic.downloadSchematics();
                Schematic.unzipSchematics();
                LOGGER.info("Updated the schematics!");
            } catch (Exception e) {
                LOGGER.error("Failed updating schematics");
                throw new CompletionException(e);
            }
        }).exceptionally(ex -> {
            LOGGER.error("Failed updating schematics!");
            return null;
        });
    }
}