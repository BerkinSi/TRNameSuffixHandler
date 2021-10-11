import UIKit

class TurkishSuffixHelper {
    
    static var shared: TurkishSuffixHelper {
        return TurkishSuffixHelper()
    }
    
    //{NEWHIRE_NAME}{iyelik} -> call get name for iyelik
    //{NEWHIRE_NAME}{belirtmeHal} -> call get name for belirtmeHal
    //{NEWHIRE_NAME}{yönelmeHal} -> call get name for yönelmeHal
    func getNameForTRSuffix(name: String) -> String{
        if name.contains("{iyelik}"){
            return getNameForİyelik(name: name)
        }else if name.contains("{belirtmeHal}"){
            return getNameForBelirtmeHal(name: name)
        }else if name.contains("{yönelmeHal}"){
            return getNameForYönelmeHal(name: name)
        }else {
            return name
        }
    }
    
    //example: {NEWHIRE_NAME}{iyelik} -> first, change {NEWHIRE_NAME} with actual name, then call this function
    //{NEWHIRE_NAME}{iyelik} -> Alp{iyelik} -> Alp'in
    private func getNameForİyelik(name: String) -> String {
        if name.contains("{iyelik}"){
            let nameArray = name.components(separatedBy: "{")
            let firstName = nameArray.first ?? ""
            
            let iyelikForVowel = getİyelikForVowelAtLast(char: "\(firstName.last!)".lowercased())
            
            if iyelikForVowel != ""{
                return firstName + iyelikForVowel
            }else {
                if firstName.count<2{
                    return "'nin"
                }
                let charBeforeLastChar = Array(firstName)[firstName.count-2]
                let iyelikForVowelForCharBeforeLast = getİyelikForVowelAtOneBeforeLast(char: "\(charBeforeLastChar)")
                
                if iyelikForVowelForCharBeforeLast != "" {
                    return firstName + iyelikForVowelForCharBeforeLast
                }else {
                    return firstName + getİyelikForTwoConsonanatsAtLast(name: firstName)
                }
            }
        }else {
            return "a"
        }
    }
    
    private func getİyelikForVowelAtLast(char: String) -> String{
        if char == "a"{
            return "'nın"
        }else if char == "e"{
            return "'nin"
        }else if char == "ı"{
            return "'nın"
        }else if char == "i"{
            return "'nin"
        }else if char == "o"{
            return "'nun"
        }else if char == "ö"{
            return "'nün"
        }else if char == "u"{
            return "'nun"
        }else if char == "ü"{
            return "'nün"
        }else {
            return ""
        }
    }
    
    private func getİyelikForVowelAtOneBeforeLast(char: String) -> String{
        if char == "a"{
            return "'ın"
        }else if char == "e"{
            return "'in"
        }else if char == "ı"{
            return "'ın"
        }else if char == "i"{
            return "'in"
        }else if char == "o"{
            return "'un"
        }else if char == "ö"{
            return "'ün"
        }else if char == "u"{
            return "'un"
        }else if char == "ü"{
            return "'ün"
        }else {
            return ""
        }
    }
    
    private func getİyelikForTwoConsonanatsAtLast(name: String) -> String {
        
        let lastChar = name.last ?? " "
        if name.count < 3{
            return "'ın"
        }
        let charBeforeLast = Array(name)[name.count-2]
        let vowelChar = Array(name)[name.count-3]
        
        if vowelChar == "a" || vowelChar == "A" {
            let lastTwo = "\(charBeforeLast)" + "\(lastChar)"
            if lastTwo == "lp" || lastTwo == "LP"{
                return "'in"
            }
        }
        
        if vowelChar == "a"{
            return "'ın"
        }else if vowelChar == "e"{
            return "'in"
        }else if vowelChar == "ı"{
            return "'ın"
        }else if vowelChar == "i"{
            return "'in"
        }else if vowelChar == "o"{
            return "'un"
        }else if vowelChar == "ö"{
            return "'ün"
        }else if vowelChar == "u"{
            return "'un"
        }else if vowelChar == "ü"{
            return "'ün"
        }else {
            return ""
        }
    }
    
    //example: {NEWHIRE_NAME}{belirtmeHal} -> first, change {NEWHIRE_NAME} with actual name, then call this function
    //{NEWHIRE_NAME}{belirtmeHal} -> Alp{belirtmeHal} -> Alp'i
    private func getNameForBelirtmeHal(name: String) -> String {
        if name.contains("{belirtmeHal}"){
            let nameArray = name.components(separatedBy: "{")
            let firstName = nameArray.first ?? ""
            
            let belirtmeHalForVowel = getBelirtmeHalForVowelAtLast(char: "\(firstName.last!)".lowercased())
            
            if belirtmeHalForVowel != ""{
                return firstName + belirtmeHalForVowel
            }else {
                if firstName.count < 2 {
                    return "'yı"
                }
                let charBeforeLastChar = Array(firstName)[firstName.count-2]
                let belirtmeHalForVowelForCharBeforeLast = getBelirtmeHalForVowelAtOneBeforeLast(char: "\(charBeforeLastChar)")
                
                if belirtmeHalForVowelForCharBeforeLast != "" {
                    return firstName + belirtmeHalForVowelForCharBeforeLast
                }else {
                    return firstName + getBelirtmeForTwoConsonanatsAtLast(name: firstName)
                }
            }
        }else {
            return "a"
        }
    }
    
    private func getBelirtmeHalForVowelAtLast(char: String) -> String{
        if char == "a"{
            return "'yı"
        }else if char == "e"{
            return "'yi"
        }else if char == "ı"{
            return "'yı"
        }else if char == "i"{
            return "'yi"
        }else if char == "o"{
            return "'yu"
        }else if char == "ö"{
            return "'yü"
        }else if char == "u"{
            return "'yu"
        }else if char == "ü"{
            return "'yü"
        }else {
            return ""
        }
    }
    
    private func getBelirtmeHalForVowelAtOneBeforeLast(char: String) -> String{
        if char == "a"{
            return "'ı"
        }else if char == "e"{
            return "'i"
        }else if char == "ı"{
            return "'ı"
        }else if char == "i"{
            return "'i"
        }else if char == "o"{
            return "'u"
        }else if char == "ö"{
            return "'ü"
        }else if char == "u"{
            return "'u"
        }else if char == "ü"{
            return "'ü"
        }else {
            return ""
        }
    }
    
    private func getBelirtmeForTwoConsonanatsAtLast(name: String) -> String {
        
        if name.count < 3 {
            return "'i"
        }
        
        let lastChar = name.last ?? " "
        let charBeforeLast = Array(name)[name.count-2]
        let vowelChar = Array(name)[name.count-3]
        
        if vowelChar == "a" || vowelChar == "A" {
            let lastTwo = "\(charBeforeLast)" + "\(lastChar)"
            if lastTwo == "lp" || lastTwo == "LP"{
                return "'i"
            }
        }
        
        if vowelChar == "a"{
            return "'ı"
        }else if vowelChar == "e"{
            return "'i"
        }else if vowelChar == "ı"{
            return "'ı"
        }else if vowelChar == "i"{
            return "'i"
        }else if vowelChar == "o"{
            return "'u"
        }else if vowelChar == "ö"{
            return "'ü"
        }else if vowelChar == "u"{
            return "'u"
        }else if vowelChar == "ü"{
            return "'ü"
        }else {
            return ""
        }
    }
    
    //example: {NEWHIRE_NAME}{yönelmeHal} -> first, change {NEWHIRE_NAME} with actual name, then call this function
    //{NEWHIRE_NAME}{yönelmeHal} -> Alp{yönelmeHal} -> Alp'i
    private func getNameForYönelmeHal(name: String) -> String {
        if name.contains("{yönelmeHal}"){
            let nameArray = name.components(separatedBy: "{")
            let firstName = nameArray.first ?? ""
            
            let yönelmeHalForVowel = getYönelmeHalForVowelAtLast(char: "\(firstName.last!)".lowercased())
            
            if yönelmeHalForVowel != ""{
                return firstName + yönelmeHalForVowel
            }else {
                if firstName.count < 2 {
                    return "'ye"
                }
                
                let charBeforeLastChar = Array(firstName)[firstName.count-2]
                let yönelmeHalForVowelForCharBeforeLast = getYönelmeHalForVowelAtOneBeforeLast(char: "\(charBeforeLastChar)")
                
                if yönelmeHalForVowelForCharBeforeLast != "" {
                    return firstName + yönelmeHalForVowelForCharBeforeLast
                }else {
                    //This part is not correct. Rule Should be determined
                    return firstName + getYönelmeForTwoConsonanatsAtLast(name: firstName)
                }
            }
        }else {
            return "a"
        }
    }
    
    private func getYönelmeHalForVowelAtLast(char: String) -> String{
        if char == "a"{
            return "'ya"
        }else if char == "e"{
            return "'ye"
        }else if char == "ı"{
            return "'ya"
        }else if char == "i"{
            return "'ye"
        }else if char == "o"{
            return "'ya"
        }else if char == "ö"{
            return "'ye"
        }else if char == "u"{
            return "'ya"
        }else if char == "ü"{
            return "'ye"
        }else {
            return ""
        }
    }
    
    private func getYönelmeHalForVowelAtOneBeforeLast(char: String) -> String{
        if char == "a"{
            return "'a"
        }else if char == "e"{
            return "'e"
        }else if char == "ı"{
            return "'a"
        }else if char == "i"{
            return "'e"
        }else if char == "o"{
            return "'a"
        }else if char == "ö"{
            return "'e"
        }else if char == "u"{
            return "'a"
        }else if char == "ü"{
            return "'e"
        }else {
            return ""
        }
    }
    
    private func getYönelmeForTwoConsonanatsAtLast(name: String) -> String {
        
        if name.count < 3 {
            return "'e"
        }
        
        let lastChar = name.last ?? " "
        let charBeforeLast = Array(name)[name.count-2]
        let vowelChar = Array(name)[name.count-3]
        
        if vowelChar == "a" || vowelChar == "A" {
            let lastTwo = "\(charBeforeLast)" + "\(lastChar)"
            if lastTwo == "lp" || lastTwo == "LP"{
                return "'e"
            }
        }
        
        if vowelChar == "a"{
            return "'a"
        }else if vowelChar == "e"{
            return "'e"
        }else if vowelChar == "ı"{
            return "'a"
        }else if vowelChar == "i"{
            return "'e"
        }else if vowelChar == "o"{
            return "'a"
        }else if vowelChar == "ö"{
            return "'e"
        }else if vowelChar == "u"{
            return "'a"
        }else if vowelChar == "ü"{
            return "'e"
        }else {
            return ""
        }
    }
}
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
//
//    let namesWithTwoConsonantsAtLast = ["BÜLENT",
//                                        "KONURALP",
//                                        "KIVANÇ",
//                                        "CENK",
//                                        "LEVENT",
//                                        "CÜNEYT",
//                                        "EDİP GÜVENÇ",
//                                        "AHMET TUNÇ",
//                                        "SEVİNÇ",
//                                        "ÖVÜNÇ",
//                                        "İNANÇ",
//                                        "ERDİNÇ",
//                                        "MERT",
//                                        "BURÇ",
//                                        "CÖMERT",
//                                        "BERK",
//                                        "ALP"]
//
