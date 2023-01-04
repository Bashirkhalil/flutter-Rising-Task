


class CurrencyPojo {

   String base_code;
   String rates;

   CurrencyPojo({
   required this.base_code ,
   required this.rates ,
   });


   static CurrencyPojo  fromJson(json) =>  CurrencyPojo (
     base_code : json['base_code'] ,
     rates : json['rates'] ,
   );



}