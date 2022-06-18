

class StudentValidator {

   String? validateName(String? value) {
    if (value!.isEmpty)
      return 'Name alanı boş olamaz';

    if (value.length < 3)
      return 'Name en az 3 karakter olmalı';

  }

   String? validateLastName(String? value) {
     if (value!.isEmpty)
       return 'Soyad alanı boş olamaz';

     if (value.length < 3)
       return 'Soyad en az 3 karakter olmalı';

   }

   String? validateGrade(String? value) {
     var grade = int.parse(value!);
      if (grade == null )
        return 'Puan alanı sayısal olmalı';

      if (grade < 0 || grade > 100)
        return 'Puan 0 ile 100 arasında olmalı';

   }


}
