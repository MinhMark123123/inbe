echo "Generating --> assets"

# === Main ===
flutter pub get
# Assets

#cp -a assets/l10n /lib/l10n
#Gen-l10n
flutter gen-l10n
cp -a .dart_tool/flutter_gen/gen_l10n lib

flutter packages pub run build_runner build --delete-conflicting-outputs


##cp -a assets/l10n /lib/l10n
##Gen-l10n
#flutter gen-l10n
#cp -a .dart_tool/flutter_gen/gen_l10n lib

## === Core ===
#cd aac_core
#
#flutter pub get
## Assets
#flutter packages pub run build_runner build --delete-conflicting-outputs
#
#cd ../