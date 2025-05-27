# dart_pptx

This is a pure dart library that can create powerpoint presentations with dart classes or markdown. This can be used in native, web, and mobile applications.

> Looking for a Flutter plugin? Check out [flutter_pptx](https://pub.dev/packages/flutter_pptx).

## Getting Started

To use this library, add `dart_pptx` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

```sh
flutter pub add dart_pptx
```

## Usage

### Creating a Presentation

First, create a new presentation.

```dart
import 'package:dart_pptx/dart_pptx.dart';

final pres = Powerpoint();
```

### Saving a Presentation

To save the presentation, call the `save` method.

```dart
final bytes = await pres.save();
```

You then can save the bytes to a file.

```dart
import 'dart:io';

final file = File('my_presentation.pptx');
await file.writeAsBytes(bytes);
```

### Adding Slides

All arguments are optional and if not provided will have the "Double Click to Edit" placeholder text.

#### Title Slide

```dart
pres.addTitleSlide(
    title: 'Title'.toTextValue(),
    author: 'Author'.toTextValue(),
);
```

#### Title and Photo Slide

```dart
pres.addTitleAndPhotoSlide(
    title: 'Title'.toTextValue(),
    subtitle: 'Subtitle'.toTextValue(),
    author: 'Author'.toTextValue(),
    image: ImageReference(
        path: './samples/images/sample_gif.gif',
        name: 'Sample Gif',
    ),
);
```

#### Title and Photo Slide (Alternative)

```dart
pres.addTitleAndPhotoAltSlide(
    title: 'Title'.toTextValue(),
    subtitle: 'Subtitle'.toTextValue(),
    image: ImageReference(
        path: './samples/images/sample_jpg.jpg',
        name: 'Sample Jpg',
    ),
);
```

#### Title and Bullets Slide

```dart
pres.addTitleAndBulletsSlide(
    title: 'Title'.toTextValue(),
    subtitle: 'Subtitle'.toTextValue(),
    bullets: [
        'Bullet 1',
        'Bullet 2',
        'Bullet 3',
        'Bullet 4',
    ].map((e) => e.toTextValue()).toList(),
);
```

#### Bullets Slide

```dart
pres.addBulletsSlide(
    bullets: [
        'Bullet 1',
        'Bullet 2',
        'Bullet 3',
        'Bullet 4',
    ].map((e) => e.toTextValue()).toList(),
);
```

#### Title, Bullets, and Photo Slide

```dart
pres.addTitleBulletsAndPhotoSlide(
    title: 'Title'.toTextValue(),
    subtitle: 'Subtitle'.toTextValue(),
    bullets: [
        'Bullet 1',
        'Bullet 2',
        'Bullet 3',
        'Bullet 4',
    ].map((e) => e.toTextValue()).toList(),
    image: ImageReference(
        path: './samples/images/sample_jpg.jpg',
        name: 'Sample Jpg',
    ),
);
```

#### Section Slide

```dart
pres.addSectionSlide(
    section: 'Section'.toTextValue(),
);
```

#### Title Only Slide

```dart
pres.addTitleOnlySlide(
    title: 'Title'.toTextValue(),
    subtitle: 'Subtitle'.toTextValue(),
);
```

### Agenda Slide

```dart
pres.addAgendaSlide(
    title: 'Title'.toTextValue(),
    subtitle: 'Subtitle'.toTextValue(),
    topics: 'Topics'.toTextValue(),
);
```

### Statement Slide

```dart
pres.addStatementSlide(
    statement: 'Statement'.toTextValue(),
);
```

### Big Fact Slide

```dart
pres.addBigFactSlide(
    information: 'Information'.toTextValue(),
    fact: 'Fact'.toTextLine(),
);
```

### Quote Slide

```dart
pres.addQuoteSlide(
    quote: 'Quote'.toTextLine(),
    attribution: 'Attribution'.toTextValue(),
);
```

### Photo 3 Up Slide

```dart
pres.addPhoto3UpSlide(
    image1: ImageReference(
        path: './samples/images/sample_jpg.jpg',
        name: 'Sample Jpg',
    ),
    image2: ImageReference(
        path: './samples/images/sample_jpg.jpg',
        name: 'Sample Jpg',
    ),
    image3: ImageReference(
        path: './samples/images/sample_jpg.jpg',
        name: 'Sample Jpg',
    ),
);
```

### Photo Slide

```dart
pres.addPhotoSlide(
    image: ImageReference(
        path: './samples/images/sample_jpg.jpg',
        name: 'Sample Jpg',
    ),
);
```

### Blank Slide

```dart
pres.addBlankSlide();
```

## Markdown

It is also possible to create a presentation using markdown.

```dart
await pres.addSlidesFromMarkdown('MARKDOWN SOURCE');
```

The markdown follows the same format for [md2googleslides](https://github.com/googleworkspace/md2googleslides).

## Slide Background

### Solid Color

Colors need to be in HEX format and not include the leading `#`.

```dart
slide.background.color = 'FF0000';
```

### Image

```dart
slide.background.image = ImageReference(
    path: './samples/images/sample_jpg.jpg',
    name: 'Sample Jpg',
);
```

## Speaker Notes

```dart
slide.speakerNotes = 'Notes'.toTextValue();
```

## Show Slide Numbers

```dart
slide.showSlideNumber = true;
```

Or for an entire presentation.

```dart
pres.showSlideNumbers = true;
```

## Images

Images use the `ImageReference` class. The `path` can be the base64 encoded string, remote url, or local file path.

The name is used for the alt and can be overridden with a description.

When the presentation is saved all images will be downloaded and saved in the presentation.

> Running on Flutter Web will cause a CORS error when using remote urls if the server does not have the correct headers. To get around this, you can use a proxy server.

## Layouts

### 4x3

```dart
pres.layout = Layout.screen4x3();
```

### 16x9

```dart
pres.layout = Layout.screen16x9();
```

### 16x10

```dart
pres.layout = Layout.screen16x10();
```

### Wide

```dart
pres.layout = Layout.screenWide();
```

### Custom

```dart
pres.layout = Layout(
    type: 'custom',
    width: 24384000,
    height: 13716000,
);
```

## Metadata

### Title

```dart
pres.title = 'Title';
```

### Subject

```dart
pres.subject = 'Subject';
```

### Author

```dart
pres.author = 'Author';
```

### Company

```dart
pres.company = 'Company';
```

### Revision

```dart
pres.revision = 'Revision';
```
# my_dart_pptx






### 🛠️ How to Add a Custom Slide Layout

- **1. Create the XML Mustache Template**  
  📁 Location: `lib/src/template/ppt/slides/`  
  🔧 Steps:  
  - Create a new file, e.g. `my_custom_layout.xml.mustache.dart`.  
  - Copy an existing template (e.g., `title_content_and_images.xml.mustache.dart`) as a base.  
  - Edit the XML to define your new layout (e.g., shapes, text boxes, images).  
  - Export the template as a Dart string constant.

- **2. Create the Slide Dart Class**  
  📁 Location: `lib/src/slides/`  
  🔧 Steps:  
  - Create a new file, e.g. `my_custom_layout.dart`.  
  - Define a class (e.g., `SlideMyCustomLayout`) that extends `Slide`.  
  - Add fields for all the data the layout needs (e.g., title, content, images).  
  - Override the `source` getter to return your new template.  
  - Implement `toJson()`, `imageRefs()`, etc. as needed.

- **3. Register the Slide in SlideTemplates Extension**  
  📁 Location: `lib/src/slides.dart`  
  🔧 Steps:  
  - Add a method to the `SlideTemplates` extension (e.g., `addMyCustomLayoutSlide(...)`).  
  - Use your new class inside this function.

- **4. (Optional) Export the Slide File**  
  📁 Location: `lib/src/slides.dart`  
  🔧 Steps:  
  - Add an export line for your new slide file:  
    ```dart
    export 'slides/my_custom_layout.dart';
    ```

- **5. Use Your New Slide Layout**  
  ✅ You can now use your layout like so:  
  ```dart
  presentation.addMyCustomLayoutSlide(...);
  ```

Summary Table
| Step | File/Folder | Example Filename |
|------|-------------|-----------------|
| 1 | lib/src/template/ppt/slides/ | my_custom_layout.xml.mustache.dart |
| 2 | lib/src/slides/ | my_custom_layout.dart |
| 3 | lib/src/slides.dart | (add function in extension) |
| 4 | lib/src/slides.dart | (add export) |



Tip:
Use clear, descriptive names for your layout and fields.
You can look at existing layouts (like title_content_and_images) for reference.
