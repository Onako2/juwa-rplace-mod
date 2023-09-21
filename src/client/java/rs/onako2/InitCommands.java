package rs.onako2;

import net.fabricmc.api.ClientModInitializer;
import net.fabricmc.fabric.api.client.command.v2.ClientCommandManager;
import net.fabricmc.fabric.api.client.command.v2.ClientCommandRegistrationCallback;
import net.minecraft.text.Text;

public class InitCommands implements ClientModInitializer {
    @Override
    public void onInitializeClient() {
        ClientCommandRegistrationCallback.EVENT.register((dispatcher, registryAccess) -> {
            dispatcher.register(
                    ClientCommandManager.literal("refresh-schematics").executes(context -> {
                        context.getSource().sendFeedback(Text.literal("Updating schematics.."));

                        
                        Schematic.downloadSchematics();
                        Schematic.unzipSchematics();

                        context.getSource().sendFeedback(Text.literal("Schematics updated!"));
                        return 0;
                    }));
        });
    }
}