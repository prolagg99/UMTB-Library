import 'package:umtb_library/Library/model/LibraryModels.dart';

List<LibraryBookDetails> getBookDetails() {
  List<LibraryBookDetails> list = [];

// i should get this books details from a DB
  LibraryBookDetails model1 = LibraryBookDetails();
  model1.title = 'Climatologie Et Temps Phisique AtomiquePhisique Atomique';
  model1.author = 'alain char';
  model1.speciality = 'ELECTRONIC';
  model1.subfield = 'Phisique Atomique';
  model1.listing = '330/64';

// RTL direction
  LibraryBookDetails model2 = LibraryBookDetails();
  model2.title = 'إدارة الاعمال';
  model2.author = 'محمد الصيرفي';
  model2.speciality = 'ECONOMIC';
  model2.subfield = 'التنسيق الإداري';
  model2.listing = '330/64';

  LibraryBookDetails model3 = LibraryBookDetails();
  model3.title = 'Climatologie Et Temps Phisique AtomiquePhisique Atomique';
  model3.author = 'alain char';
  model3.speciality = 'ELECTRONIC';
  model3.subfield = 'Phisique Atomique';
  model3.listing = '330/64';

  LibraryBookDetails model4 = LibraryBookDetails();
  model4.title = 'Climatologie Et Temps Phisique AtomiquePhisique Atomique';
  model4.author = 'alain char';
  model4.speciality = 'ELECTRONIC';
  model4.subfield = 'Phisique Atomique';
  model4.listing = '330/64';

  LibraryBookDetails model5 = LibraryBookDetails();
  model5.title = 'Climatologie Et Temps Phisique AtomiquePhisique Atomique';
  model5.author = 'alain char';
  model5.speciality = 'ELECTRONIC';
  model5.subfield = 'Phisique Atomique';
  model5.listing = '330/64';

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);

  return list;
}
