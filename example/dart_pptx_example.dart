import 'package:dart_pptx/dart_pptx.dart';
import 'dart:io';

import 'image_paths.dart';

void main() async {
  // Create a new presentation
  var presentation = PowerPoint();

  // Sample content for slides
  final String content = '''
    This is a sample content that can be used across multiple slides.
    It demonstrates how to add text content to your presentation slides.
    You can customize this content as needed for your specific use case.
  ''';

  // Add a title slide
  presentation.addTitleSlide(
    title: TextValue.uniform('My Presentation'),
  );

  // Add a slide with two images and captions (content down)
  presentation.addTitleContentTwoImageCaptionSlide(
    title: TextValue.uniform('Two Images with Content Below'),
    content: TextValue.uniform(content),
    image1: ImageReference(path: image1Url, name: 'First Image'),
    caption1: TextValue.uniform('This is the caption for the first image'),
    image2: ImageReference(path: image2Url, name: 'Second Image'),
    caption2: TextValue.uniform('This is the caption for the second image'),
    contentDown: true,
  );

  // Add a slide with two images and captions (content up)
  presentation.addTitleContentTwoImageCaptionSlide(
    title: TextValue.uniform('Two Images with Content Above'),
    content: TextValue.uniform(content),
    image1: ImageReference(path: image1Url, name: 'First Image'),
    caption1: TextValue.uniform('Caption for image 1'),
    image2: ImageReference(path: image2Url, name: 'Second Image'),
    caption2: TextValue.uniform('Caption for image 2'),
    contentDown: false,
  );

  // Add a slide with one image on the right
  presentation.addTitleContentAndOneImageSlide(
    title: TextValue.uniform('Single Image (Right)'),
    content: TextValue.uniform(content),
    image: ImageReference(path: image1Url, name: 'Right Image'),
    caption: TextValue.uniform('This image is positioned on the right'),
    contentRight: true,
  );

  // Add a slide with one image on the left
  presentation.addTitleContentAndOneImageSlide(
    title: TextValue.uniform('Single Image (Left)'),
    content: TextValue.uniform(content),
    image: ImageReference(path: image2Url, name: 'Left Image'),
    caption: TextValue.uniform('This image is positioned on the left'),
    contentRight: false,
  );

  // Add a features slide with Two images content Right
  presentation.addTitleContentAndImagesSlide(
    title: TextValue.uniform('Key Features'),
    content: TextValue.uniform('''
      • Feature 1: Easy to use
      • Feature 2: Flexible layout
      • Feature 3: Multiple image support
      • Feature 4: Customizable captions
    '''),
    contentRight: true,
    image1: ImageReference(path: image1Url, name: 'Feature Demo 1'),
    image2: ImageReference(path: image2Url, name: 'Feature Demo 2'),
    caption1: TextValue.uniform('First feature demonstration'),
    caption2: TextValue.uniform('Second feature demonstration'),
  );

  // Add a features slide with Two images content Left
  presentation.addTitleContentAndImagesSlide(
    title: TextValue.uniform('Key Features'),
    content: TextValue.uniform('''
      • Feature 1: Easy to use
      • Feature 2: Flexible layout
      • Feature 3: Multiple image support
      • Feature 4: Customizable captions
    '''),
    contentRight: false,
    image1: ImageReference(path: image1Url, name: 'Feature Demo 1'),
    image2: ImageReference(path: image2Url, name: 'Feature Demo 2'),
    caption1: TextValue.uniform('First feature demonstration'),
    caption2: TextValue.uniform('Second feature demonstration'),
  );

  // Save the presentation
  final bytes = await presentation.save();
  if (bytes != null) {
    File('./example_presentation.pptx').writeAsBytesSync(bytes);
    print('Presentation saved successfully as example_presentation.pptx');
  } else {
    print('Failed to save presentation');
  }
}
