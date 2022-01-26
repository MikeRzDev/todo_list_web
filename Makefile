generate:
	flutter packages pub run build_runner build --delete-conflicting-outputs

watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

app-ios:
	flutter build ios --release

app-android:
	flutter build apk  

clean_rebuild:
	flutter clean && flutter packages get