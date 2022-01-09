import 'package:umtb_library/Library/model/LibraryModels.dart';

List<BookDetails> getBookDetails() {
  List<BookDetails> list = [];

// i should get this books details from a DB
  BookDetails model = BookDetails();
  model.title = 'climatologie et temps phisique atomique phisique atomique';
  model.author = 'alain char';
  model.speciality = 'electronic';
  model.subfield = 'phisique atomique';
  model.listing = '330/64';

// RTL direction
  BookDetails model2 = BookDetails();
  model2.title = 'إدارة الاعمال';
  model2.author = 'محمد الصيرفي';
  model2.speciality = 'economic';
  model2.subfield = 'التنسيق الإداري';
  model2.listing = '330/64';

  BookDetails model3 = BookDetails();
  model3.title = 'climatologie et temps';
  model3.author = 'alain char';
  model3.speciality = 'electronic';
  model3.subfield = 'phisique atomique';
  model3.listing = '330/64';

  BookDetails model4 = BookDetails();
  model4.title = 'climatologie et temps phisique atomique phisique atomique';
  model4.author = 'alain char';
  model4.speciality = 'electronic';
  model4.subfield = 'phisique atomique';
  model4.listing = '330/64';

  BookDetails model5 = BookDetails();
  model5.title = 'climatologie et temps phisique atomique phisique atomique';
  model5.author = 'alain char';
  model5.speciality = 'electronic';
  model5.subfield = 'phisique atomique';
  model5.listing = '330/64';

  BookDetails model6 = BookDetails();
  model6.title = 'climatologie et temps phisique atomique phisique atomique';
  model6.author = 'alain char';
  model6.speciality = 'electronic';
  model6.subfield = 'phisique atomique';
  model6.listing = '330/64';

  BookDetails model7 = BookDetails();
  model7.title = 'climatologie et temps phisique atomique phisique atomique';
  model7.author = 'alain char';
  model7.speciality = 'electronic';
  model7.subfield = 'phisique atomique';
  model7.listing = '330/64';

  list.add(model);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);
  list.add(model6);
  list.add(model7);

  return list;
}
