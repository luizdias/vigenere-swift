@main
struct vigenere_swift {

    static let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    static func main() {
        let cypheredLetter: String = """
WML, HAEXRV SCL ZETTT! OPWCLVR ZTZR. M'E RCEVWCBYC DXDVRY XV GLW NMNV 1883, SCL V LAS BUMK AMGXWG QA LGEMF XZPB VX ODCYH GCM QEQ GMNGZ NWH. (M YDB GLW XLRE XGWZ XZT UBZAT "ZRXMGV OEUZENVVH BB XZT XNWL PONMF 3," LPVGZ XA EIIJQEIV KQRAACO SSJ IQZI SRIQIEN NEIKWURR.) QDC'II HGWOETAG TSL P TBX GU YHIKIQBRK, PVQ EXIME XZT MIIFIA BJ OTQEHEPORHVDV, ZEF, X LBR'L QTNQW NWH! WG WMEI'K LPNX ZPXCIFTL: NJLTZ TPGQVNV, A LIF KWIBVRY P TBX GU NYEC UWE PGHQAK S VTNHAPBBV XXOUX LD BJS UWQYHJTV. RZWC BUSMVP V KGI UL NGQ JNGC (IPNRCH NBV LWIG, FQ IPR ASN!), UL JWATBA GUNVGWGA XIHI KNPDXVT QW WCEXXJT AMUZVNQWH. BVQW QIOC ZXUFIDU KNPDTL ZI FD-NEMWCLVR TAIAHAC! LB CGJ SASO LPNX AI'A YMCT BB PAKM YMCT BUEL? YCFX SH Q JEK IPVRCXVT M ODCYH YXDR EFNBUMFV NBV LXUR FSQG'F VWHXRGL, IPVW OTQEH LGQNRYAM TYQ HPBAWS CC MF BG QVWPUF EFS ANMV IPNX ZT EBYDS UNOW HCEI LXUR FSQG AINTZ OSLWMEIV BM NKSXV. NPD X PNH LD LB ASH AUECT PVW ZPVQ! M'NT VRZWG JRIF VZREL PB ZECXVT HWRQFMGCA HRVTZ CVWHAHVW, PVQ, AWAT, LSM ZVBA LWM EIKI! EUIF X IJSCT, BUEL HBHTAS BEMSCOYI ZPL HWWS UL FGSG GS LGIIID IPESMVP GMET IAH VTAGVGN BUI WCBVVW JVVZWGAR-EFS BVQW QIOC, LDW! YYUZQYC, LXUR FSQG VWF'I LREV . . . TFNGLAG. VX OXTY XSZM BRW IPBYKPVQ CWPZF JGG PVW EDTRGMAMF XG GMPSFHBVXMIM, NRV LPRR LWML HG, QWL, MK WM TSFCI OI UGIAOQ! IPR XABM NKWCBF EDHW FYJKQIIV-IPRC GCTL WWCL GLWXZ USDD-XESBTKGMGCA BYL DV QEFVMESMH UVWKXWAW. TJB YSDEP NRV SCAHYGMA AWGM SYJXWHW SQWHX OWIG M VXL! BJ UDCEWW, IPVW ETIAW LWIG XZTZR MK P LVQWCAVSF-LQQI EPVUYFI WS EYTVGW LGGVRY IW SMFS UR EFS JEMFV UR XG YCFXARM. OYL XB JEK PTY E EXAGECT! BUI DPAG XZXVT M OPVG MK IW TS TPKX XG YIVP, KD Q'II TTMA LASQAK GJB VR LWM CEKI. QG ASH NHR XDZ N AZXTR-WWTQAK LWM FMYWBF, GZPBGMFV EVXZ WQFXGGQPED UQTYJTA, IMKXBVRY IPR '50W LD BEC LD TREJC BUI LLQFX. (A PKPMVTVGEDAG GAAHBRH EN IAODT IAH UDCYHF'I ENPC UWE E OTMX.) M OPVGIV IW PLWRS BYL IPR SDS ERWL, IWB, FMI EUIF X BEENTTRH ZTZR, M SRKVHWCBNPDN ICTWPZRH JXOUX AC NESFI WS E LGIVR SCL ZC LXUR XSEM JEK HPNXLTZRH ACBB JAUBL TATKRW. (SAAB, M LWQAO LWM GVSXV ZMYWB UENT OBRW DNS XZT ZNMDH. PBTWUCYPQ IPNX AHV'G MF IPR LAHBBVQ QWBOK!) PVLASN, Q WYKI ENRLTL GS KPG ASL IW JSJGG NFGJB ZI! A'KM ZEFPORH LD JYIFS QA XG IPR TGECYEUT, IAH A VWG E BDJ NW S EWPOWI ENXUW ZRTSXZZEF. X'DR EDHW PEMVPG SFT WS XZDAR GGDT TSDS ZHWZ-TZN HAHMNWWH BUEL'GM FS HDXHPSG QA XZTAR XABMF, EFS Q NQ DDDVRY IPR RGHBNPYXI! GLSCSF JGG IYP QDCE LWAX, NRV XN NRQ IQZI SVMAXK RWZI DDWXMFV NBV ET, BRPD IPRQ QDC QSF'I SASO CWGLACO! OPWCLVR TAMANSBQA FDPVQMF, 1883 
"""

        for _ in 1...10 {
            for subsequence in cypheredLetter.split(separator: " ") {
                let word = String(subsequence)
                let decypherdMsg: String = Self.decypher(encryptedText: cypheredLetter, key: word)
                print(decypherdMsg)
            }
        }
    }

    static func decypher(encryptedText: String, key: String) -> String {        
        
        var charToInt: [Character: Int] = [:]
        var intToChar: [Int: Character] = [:]
    
        for (index, character) in Self.alphabet.enumerated() {
            charToInt[character] = index
            intToChar[index] = character
        }
        
        let uppercaseText = encryptedText.uppercased()
        let uppercaseKey = key.uppercased()
        var decryptedOutput = ""
        var keyIndex = 0

        // Prepare a clean key consisting only of letters
        let cleanKey = uppercaseKey.filter { $0.isLetter }
        guard !cleanKey.isEmpty else { return encryptedText }

        for character in uppercaseText {
            if character.isLetter {
                // Use dictionary lookup to get values
                let textValue = charToInt[character]!
                let currentKeyChar = cleanKey[cleanKey.index(cleanKey.startIndex, offsetBy: keyIndex % cleanKey.count)]
                let keyValue = charToInt[currentKeyChar]!

                // Decryption formula: (Text Value - Key Value + 26) mod 26
                let shiftedValue = (textValue - keyValue + 26) % 26

                // Use dictionary lookup to get the new character
                let newCharacter = intToChar[shiftedValue]!
                decryptedOutput.append(newCharacter)

                // Advance the key index
                keyIndex += 1
            } else {
                // Preserve non-alphabetic characters
                decryptedOutput.append(character)
            }
        }
        return decryptedOutput
    }
}
