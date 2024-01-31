package rs.onako2;

import com.mojang.brigadier.context.CommandContext;
import net.fabricmc.api.ClientModInitializer;
import net.fabricmc.fabric.api.client.command.v2.ClientCommandManager;
import net.fabricmc.fabric.api.client.command.v2.ClientCommandRegistrationCallback;
import net.fabricmc.fabric.api.client.command.v2.FabricClientCommandSource;
import net.minecraft.text.Text;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionException;

public class InitCommands implements ClientModInitializer {
    @Override
    public void onInitializeClient() {
        ClientCommandRegistrationCallback.EVENT.register((dispatcher, registryAccess) -> {
            dispatcher.register(
                    ClientCommandManager.literal("refresh-schematics").executes(context -> {

                        context.getSource().sendFeedback(Text.literal("Updating schematics.."));

                        CompletableFuture.runAsync(() -> {
                            try {
                                Schematic.downloadSchematics();
                                Schematic.unzipSchematics();
                                context.getSource().sendFeedback(Text.literal("Schematics updated!"));
                            } catch (Exception e) {
                                throw new CompletionException(e);
                            }
                        }).exceptionally(ex -> {
                            context.getSource().sendFeedback(Text.literal("Failed to update schematics: " + ex.getMessage()));
                            return null;
                        });

                        return 0;
                    }));
        });
    }
}