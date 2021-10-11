# TRNameSuffixHandler
Swift file to help you localize your Turkish names with your fav suffixes
TRSuffixHelper Kullanımı

//nhName = “Mahmut”
Örnek localized string ->"AbcHeaderText" = "Gelişim notu girmesi için {NEWHIRE_NAME}{yönelmeHal} bildirim gönderin.";
```
var headerText = CommonHelper.shared.getLocalizedString(key: "AbcHeaderText", lang: lang)

//headerText = Gelişim notu girmesi için {NEWHIRE_NAME}{yönelmeHal} bildirim gönderin.


headerText = headerText.replacingOccurrences(of: "{NEWHIRE_NAME}", with: nhName)
//headerText = Gelişim notu girmesi için Mahmut{yönelmeHal} bildirim gönderin.

//Dil Türkçe ise
//String kelimelere ayrılır

let headerTextArray = infoText.components(separatedBy: " ")

//headerTextArray = [ “Gelişim”, “notu”, “girmesi”, “için”, “{NEWHIRE_NAME}{yönelmeHal}”, “bildirim”, “gönderin”.]

//içinde isim olan kelimeler belirlenir
let elementsContainingName = headerTextArray.filter({$0.contains("\(nhName)")})
//elementsContainingName = [“mahmut{yönelmeHal}”]
            
            for element in elementsContainingName {
	//element = “mahmut{yönelmeHal}”
                
let nameWithSuffix = TurkishSuffixHelper.shared.getNameForTRSuffix(name: element)
	//nameWithSuffix = “Mahmut’a”

               headerText = headerText.replacingOccurrences(of: element, with: nameWithSuffix)
	// headerText = “Gelişim notu girmesi için Mahmut’a bildirim gönderin.”
            }
}
```

EK Listesi, Örnekler:
//    let suffixesForNameTypeList = [
//        "iyelik", //Berkin'in
//        "belirtmeHal", //Berkin'i
//        "yönelmeHal", //Berkin'e
//    ]
//
//    let iyelikEkleri = [
//        "'in",//Alp'in
//        "'ın",//Göktan'ın
//        "'nın",//Arda'nın
//        "'nin",//Emre'nin
//        "'un",//Tuğrul'un
//        "'ün",//Ergün'ün
//    ]
//
//    let belirtmeHalEkleri = [
//        "'i",//Alp'i
//        "'ı",//Göktan'ı
//        "'yı",//Arda'yı
//        "'yi",//Emre'yi
//        "'u",//Tuğrul'u
//        "'ü",//Ergün'ü
//    ]
//
//    let yönelmeHalEkleri = [
//        "'e",//Alp'e
//        "'a",//Göktan'a
//        "'ya",//Arda'ya
//        "'ye",//Emre'ye
//    ]

