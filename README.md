# app_config_flavors

A new Flutter project.

## Getting Started

Gerar build usando dart-define

#Android
Adicionar o script abaixo no build.gradle (app):

def dartEnvironmentVariables = [
    APP_NAME: 'app_config_flavors',
    SUFFIX_NAME: null
];

if (project.hasProperty('dart-defines')) {
    dartEnvironmentVariables = dartEnvironmentVariables + project.property('dart-defines')
            .split(',')
            .collectEntries { entry ->
                def pair = new String(entry.decodeBase64(), 'UTF-8').split('=')
                [(pair.first()): pair.last()]
            }
}

Para gerar o arquivo apk ou bundle:

flutter build apk --dart-define-from-file=env.desenvolvimento.json --debug


#IOS
Adicionar o script abaixo no Pré-actions do Runner

function entry_decode() { echo "${*}" | base64 --decode; }

IFS=',' read -r -a define_items <<< "$DART_DEFINES"


for index in "${!define_items[@]}"
do
    define_items[$index]=$(entry_decode "${define_items[$index]}");
done

printf "%s\n" "${define_items[@]}"|grep '^' > ${SRCROOT}/Flutter/Define.xcconfig

### Edit Schema
![Alt text](edit_schema.png)
### Pré-actions
![Alt text](Pré-actions.png)
### Build Script
![Alt text](Build-script.png)

Para gerar o arquivo ipa:

flutter build ipa --dart-define-from-file=env.desenvolvimento.json



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
