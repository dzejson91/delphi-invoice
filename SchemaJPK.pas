
{***********************************************************************}
{                                                                       }
{                           XML Data Binding                            }
{                                                                       }
{         Generated on: 11.06.2018 20:17:19                             }
{       Generated from: C:\Users\Krystian\Downloads\FV\jpk_schema.xsd   }
{   Settings stored in: C:\Users\Krystian\Downloads\FV\jpk_schema.xdb   }
{                                                                       }
{***********************************************************************}

unit SchemaJPK;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLJPK = interface;
  IXMLTNaglowek = interface;
  IXMLPodmiot1 = interface;
  IXMLTIdentyfikatorOsobyNiefizycznej = interface;
  IXMLTAdresPolski = interface;
  IXMLFaktura = interface;
  IXMLFakturaList = interface;
  IXMLFakturaCtrl = interface;
  IXMLStawkiPodatku = interface;
  IXMLFakturaWiersz = interface;
  IXMLFakturaWierszList = interface;
  IXMLFakturaWierszCtrl = interface;
  IXMLNaglowek = interface;
  IXMLKodFormularza = interface;

{ IXMLJPK }

  IXMLJPK = interface(IXMLNode)
    ['{54194595-F718-4FA8-97E0-8E5A1F448A11}']
    { Property Accessors }
    function getNaglowek: IXMLNaglowek;
    function getPodmiot1: IXMLPodmiot1;
    function getFaktura: IXMLFakturaList;
    function getFakturaCtrl: IXMLFakturaCtrl;
    function getStawkiPodatku: IXMLStawkiPodatku;
    function getFakturaWiersz: IXMLFakturaWierszList;
    function getFakturaWierszCtrl: IXMLFakturaWierszCtrl;
    { Methods & Properties }
    property Naglowek: IXMLNaglowek read getNaglowek;
    property Podmiot1: IXMLPodmiot1 read getPodmiot1;
    property Faktura: IXMLFakturaList read getFaktura;
    property FakturaCtrl: IXMLFakturaCtrl read getFakturaCtrl;
    property StawkiPodatku: IXMLStawkiPodatku read getStawkiPodatku;
    property FakturaWiersz: IXMLFakturaWierszList read getFakturaWiersz;
    property FakturaWierszCtrl: IXMLFakturaWierszCtrl read getFakturaWierszCtrl;
  end;

{ IXMLTNaglowek }

  IXMLTNaglowek = interface(IXMLNode)
    ['{07060E3E-49EC-400F-B3F0-FC7E2740D245}']
    { Property Accessors }
    function getKodFormularza: IXMLKodFormularza;
    function getWariantFormularza: ShortInt;
    function getCelZlozenia: ShortInt;
    function getDataWytworzeniaJPK: WideString;
    function getDataOd: WideString;
    function getDataDo: WideString;
    function getDomyslnyKodWaluty: WideString;
    function getKodUrzedu: WideString;
    procedure setWariantFormularza(Value: ShortInt);
    procedure setCelZlozenia(Value: ShortInt);
    procedure setDataWytworzeniaJPK(Value: WideString);
    procedure setDataOd(Value: WideString);
    procedure setDataDo(Value: WideString);
    procedure setDomyslnyKodWaluty(Value: WideString);
    procedure setKodUrzedu(Value: WideString);
    { Methods & Properties }
    property KodFormularza: IXMLKodFormularza read getKodFormularza;
    property WariantFormularza: ShortInt read getWariantFormularza write setWariantFormularza;
    property CelZlozenia: ShortInt read getCelZlozenia write setCelZlozenia;
    property DataWytworzeniaJPK: WideString read getDataWytworzeniaJPK write setDataWytworzeniaJPK;
    property DataOd: WideString read getDataOd write setDataOd;
    property DataDo: WideString read getDataDo write setDataDo;
    property DomyslnyKodWaluty: WideString read getDomyslnyKodWaluty write setDomyslnyKodWaluty;
    property KodUrzedu: WideString read getKodUrzedu write setKodUrzedu;
  end;

{ IXMLPodmiot1 }

  IXMLPodmiot1 = interface(IXMLNode)
    ['{82CE5A4D-C60D-4992-8FA6-A1DFD3F25DCA}']
    { Property Accessors }
    function getIdentyfikatorPodmiotu: IXMLTIdentyfikatorOsobyNiefizycznej;
    function getAdresPodmiotu: IXMLTAdresPolski;
    { Methods & Properties }
    property IdentyfikatorPodmiotu: IXMLTIdentyfikatorOsobyNiefizycznej read getIdentyfikatorPodmiotu;
    property AdresPodmiotu: IXMLTAdresPolski read getAdresPodmiotu;
  end;

{ IXMLTIdentyfikatorOsobyNiefizycznej }

  IXMLTIdentyfikatorOsobyNiefizycznej = interface(IXMLNode)
    ['{05B3924E-A156-4865-BADC-FAFDA0D7B394}']
    { Property Accessors }
    function getNIP: WideString;
    function getPelnaNazwa: WideString;
    function getREGON: WideString;
    procedure setNIP(Value: WideString);
    procedure setPelnaNazwa(Value: WideString);
    procedure setREGON(Value: WideString);
    { Methods & Properties }
    property NIP: WideString read getNIP write setNIP;
    property PelnaNazwa: WideString read getPelnaNazwa write setPelnaNazwa;
    property REGON: WideString read getREGON write setREGON;
  end;

{ IXMLTAdresPolski }

  IXMLTAdresPolski = interface(IXMLNode)
    ['{8D3A5ADD-2AFE-4FCF-90DC-BDF9E2E6E530}']
    { Property Accessors }
    function getKodKraju: WideString;
    function getWojewodztwo: WideString;
    function getPowiat: WideString;
    function getGmina: WideString;
    function getUlica: WideString;
    function getNrDomu: WideString;
    function getNrLokalu: WideString;
    function getMiejscowosc: WideString;
    function getKodPocztowy: WideString;
    function getPoczta: WideString;
    procedure setKodKraju(Value: WideString);
    procedure setWojewodztwo(Value: WideString);
    procedure setPowiat(Value: WideString);
    procedure setGmina(Value: WideString);
    procedure setUlica(Value: WideString);
    procedure setNrDomu(Value: WideString);
    procedure setNrLokalu(Value: WideString);
    procedure setMiejscowosc(Value: WideString);
    procedure setKodPocztowy(Value: WideString);
    procedure setPoczta(Value: WideString);
    { Methods & Properties }
    property KodKraju: WideString read getKodKraju write setKodKraju;
    property Wojewodztwo: WideString read getWojewodztwo write setWojewodztwo;
    property Powiat: WideString read getPowiat write setPowiat;
    property Gmina: WideString read getGmina write setGmina;
    property Ulica: WideString read getUlica write setUlica;
    property NrDomu: WideString read getNrDomu write setNrDomu;
    property NrLokalu: WideString read getNrLokalu write setNrLokalu;
    property Miejscowosc: WideString read getMiejscowosc write setMiejscowosc;
    property KodPocztowy: WideString read getKodPocztowy write setKodPocztowy;
    property Poczta: WideString read getPoczta write setPoczta;
  end;

{ IXMLFaktura }

  IXMLFaktura = interface(IXMLNode)
    ['{B6D3A462-5912-4C69-8C74-0CC79E89394E}']
    { Property Accessors }
    function getTyp: WideString;
    function getP_1: WideString;
    function getP_2A: WideString;
    function getP_3A: WideString;
    function getP_3B: WideString;
    function getP_3C: WideString;
    function getP_3D: WideString;
    function getP_4A: WideString;
    function getP_4B: WideString;
    function getP_5A: WideString;
    function getP_5B: WideString;
    function getP_6: WideString;
    function getP_13_1: WideString;
    function getP_14_1: WideString;
    function getP_13_2: WideString;
    function getP_14_2: WideString;
    function getP_13_3: WideString;
    function getP_14_3: WideString;
    function getP_13_4: WideString;
    function getP_14_4: WideString;
    function getP_13_5: WideString;
    function getP_14_5: WideString;
    function getP_13_6: WideString;
    function getP_13_7: WideString;
    function getP_15: WideString;
    function getP_16: Boolean;
    function getP_17: Boolean;
    function getP_18: Boolean;
    function getP_19: Boolean;
    function getP_19A: WideString;
    function getP_19B: WideString;
    function getP_19C: WideString;
    function getP_20: Boolean;
    function getP_20A: WideString;
    function getP_20B: WideString;
    function getP_21: Boolean;
    function getP_21A: WideString;
    function getP_21B: WideString;
    function getP_21C: WideString;
    function getP_22A: WideString;
    function getP_22B: WideString;
    function getP_22C: WideString;
    function getP_23: Boolean;
    function getP_106E_2: Boolean;
    function getP_106E_3: Boolean;
    function getP_106E_3A: WideString;
    function getRodzajFaktury: WideString;
    function getPrzyczynaKorekty: WideString;
    function getNrFaKorygowanej: WideString;
    function getOkresFaKorygowanej: WideString;
    function getZALZaplata: WideString;
    function getZALPodatek: WideString;
    procedure setTyp(Value: WideString);
    procedure setP_1(Value: WideString);
    procedure setP_2A(Value: WideString);
    procedure setP_3A(Value: WideString);
    procedure setP_3B(Value: WideString);
    procedure setP_3C(Value: WideString);
    procedure setP_3D(Value: WideString);
    procedure setP_4A(Value: WideString);
    procedure setP_4B(Value: WideString);
    procedure setP_5A(Value: WideString);
    procedure setP_5B(Value: WideString);
    procedure setP_6(Value: WideString);
    procedure setP_13_1(Value: WideString);
    procedure setP_14_1(Value: WideString);
    procedure setP_13_2(Value: WideString);
    procedure setP_14_2(Value: WideString);
    procedure setP_13_3(Value: WideString);
    procedure setP_14_3(Value: WideString);
    procedure setP_13_4(Value: WideString);
    procedure setP_14_4(Value: WideString);
    procedure setP_13_5(Value: WideString);
    procedure setP_14_5(Value: WideString);
    procedure setP_13_6(Value: WideString);
    procedure setP_13_7(Value: WideString);
    procedure setP_15(Value: WideString);
    procedure setP_16(Value: Boolean);
    procedure setP_17(Value: Boolean);
    procedure setP_18(Value: Boolean);
    procedure setP_19(Value: Boolean);
    procedure setP_19A(Value: WideString);
    procedure setP_19B(Value: WideString);
    procedure setP_19C(Value: WideString);
    procedure setP_20(Value: Boolean);
    procedure setP_20A(Value: WideString);
    procedure setP_20B(Value: WideString);
    procedure setP_21(Value: Boolean);
    procedure setP_21A(Value: WideString);
    procedure setP_21B(Value: WideString);
    procedure setP_21C(Value: WideString);
    procedure setP_22A(Value: WideString);
    procedure setP_22B(Value: WideString);
    procedure setP_22C(Value: WideString);
    procedure setP_23(Value: Boolean);
    procedure setP_106E_2(Value: Boolean);
    procedure setP_106E_3(Value: Boolean);
    procedure setP_106E_3A(Value: WideString);
    procedure setRodzajFaktury(Value: WideString);
    procedure setPrzyczynaKorekty(Value: WideString);
    procedure setNrFaKorygowanej(Value: WideString);
    procedure setOkresFaKorygowanej(Value: WideString);
    procedure setZALZaplata(Value: WideString);
    procedure setZALPodatek(Value: WideString);
    { Methods & Properties }
    property Typ: WideString read getTyp write setTyp;
    property P_1: WideString read getP_1 write setP_1;
    property P_2A: WideString read getP_2A write setP_2A;
    property P_3A: WideString read getP_3A write setP_3A;
    property P_3B: WideString read getP_3B write setP_3B;
    property P_3C: WideString read getP_3C write setP_3C;
    property P_3D: WideString read getP_3D write setP_3D;
    property P_4A: WideString read getP_4A write setP_4A;
    property P_4B: WideString read getP_4B write setP_4B;
    property P_5A: WideString read getP_5A write setP_5A;
    property P_5B: WideString read getP_5B write setP_5B;
    property P_6: WideString read getP_6 write setP_6;
    property P_13_1: WideString read getP_13_1 write setP_13_1;
    property P_14_1: WideString read getP_14_1 write setP_14_1;
    property P_13_2: WideString read getP_13_2 write setP_13_2;
    property P_14_2: WideString read getP_14_2 write setP_14_2;
    property P_13_3: WideString read getP_13_3 write setP_13_3;
    property P_14_3: WideString read getP_14_3 write setP_14_3;
    property P_13_4: WideString read getP_13_4 write setP_13_4;
    property P_14_4: WideString read getP_14_4 write setP_14_4;
    property P_13_5: WideString read getP_13_5 write setP_13_5;
    property P_14_5: WideString read getP_14_5 write setP_14_5;
    property P_13_6: WideString read getP_13_6 write setP_13_6;
    property P_13_7: WideString read getP_13_7 write setP_13_7;
    property P_15: WideString read getP_15 write setP_15;
    property P_16: Boolean read getP_16 write setP_16;
    property P_17: Boolean read getP_17 write setP_17;
    property P_18: Boolean read getP_18 write setP_18;
    property P_19: Boolean read getP_19 write setP_19;
    property P_19A: WideString read getP_19A write setP_19A;
    property P_19B: WideString read getP_19B write setP_19B;
    property P_19C: WideString read getP_19C write setP_19C;
    property P_20: Boolean read getP_20 write setP_20;
    property P_20A: WideString read getP_20A write setP_20A;
    property P_20B: WideString read getP_20B write setP_20B;
    property P_21: Boolean read getP_21 write setP_21;
    property P_21A: WideString read getP_21A write setP_21A;
    property P_21B: WideString read getP_21B write setP_21B;
    property P_21C: WideString read getP_21C write setP_21C;
    property P_22A: WideString read getP_22A write setP_22A;
    property P_22B: WideString read getP_22B write setP_22B;
    property P_22C: WideString read getP_22C write setP_22C;
    property P_23: Boolean read getP_23 write setP_23;
    property P_106E_2: Boolean read getP_106E_2 write setP_106E_2;
    property P_106E_3: Boolean read getP_106E_3 write setP_106E_3;
    property P_106E_3A: WideString read getP_106E_3A write setP_106E_3A;
    property RodzajFaktury: WideString read getRodzajFaktury write setRodzajFaktury;
    property PrzyczynaKorekty: WideString read getPrzyczynaKorekty write setPrzyczynaKorekty;
    property NrFaKorygowanej: WideString read getNrFaKorygowanej write setNrFaKorygowanej;
    property OkresFaKorygowanej: WideString read getOkresFaKorygowanej write setOkresFaKorygowanej;
    property ZALZaplata: WideString read getZALZaplata write setZALZaplata;
    property ZALPodatek: WideString read getZALPodatek write setZALPodatek;
  end;

{ IXMLFakturaList }

  IXMLFakturaList = interface(IXMLNodeCollection)
    ['{5ED55090-E051-46BE-8D07-900006F5379A}']
    { Methods & Properties }
    function Add: IXMLFaktura;
    function Insert(const Index: Integer): IXMLFaktura;
    function getItem(Index: Integer): IXMLFaktura;
    property Items[Index: Integer]: IXMLFaktura read getItem; default;
  end;

{ IXMLFakturaCtrl }

  IXMLFakturaCtrl = interface(IXMLNode)
    ['{02A09AE6-1CCD-4FF5-A75B-A04D1EF3F57C}']
    { Property Accessors }
    function getLiczbaFaktur: WideString;
    function getWartoscFaktur: WideString;
    procedure setLiczbaFaktur(Value: WideString);
    procedure setWartoscFaktur(Value: WideString);
    { Methods & Properties }
    property LiczbaFaktur: WideString read getLiczbaFaktur write setLiczbaFaktur;
    property WartoscFaktur: WideString read getWartoscFaktur write setWartoscFaktur;
  end;

{ IXMLStawkiPodatku }

  IXMLStawkiPodatku = interface(IXMLNode)
    ['{D9558287-62FA-4B1E-ACB2-BE0F30684D5C}']
    { Property Accessors }
    function getStawka1: WideString;
    function getStawka2: WideString;
    function getStawka3: WideString;
    function getStawka4: WideString;
    function getStawka5: WideString;
    procedure setStawka1(Value: WideString);
    procedure setStawka2(Value: WideString);
    procedure setStawka3(Value: WideString);
    procedure setStawka4(Value: WideString);
    procedure setStawka5(Value: WideString);
    { Methods & Properties }
    property Stawka1: WideString read getStawka1 write setStawka1;
    property Stawka2: WideString read getStawka2 write setStawka2;
    property Stawka3: WideString read getStawka3 write setStawka3;
    property Stawka4: WideString read getStawka4 write setStawka4;
    property Stawka5: WideString read getStawka5 write setStawka5;
  end;

{ IXMLFakturaWiersz }

  IXMLFakturaWiersz = interface(IXMLNode)
    ['{F906D581-2D33-4705-B19A-0091A49F45F4}']
    { Property Accessors }
    function getTyp: WideString;
    function getP_2B: WideString;
    function getP_7: WideString;
    function getP_8A: WideString;
    function getP_8B: WideString;
    function getP_9A: WideString;
    function getP_9B: WideString;
    function getP_10: WideString;
    function getP_11: WideString;
    function getP_11A: WideString;
    function getP_12: WideString;
    procedure setTyp(Value: WideString);
    procedure setP_2B(Value: WideString);
    procedure setP_7(Value: WideString);
    procedure setP_8A(Value: WideString);
    procedure setP_8B(Value: WideString);
    procedure setP_9A(Value: WideString);
    procedure setP_9B(Value: WideString);
    procedure setP_10(Value: WideString);
    procedure setP_11(Value: WideString);
    procedure setP_11A(Value: WideString);
    procedure setP_12(Value: WideString);
    { Methods & Properties }
    property Typ: WideString read getTyp write setTyp;
    property P_2B: WideString read getP_2B write setP_2B;
    property P_7: WideString read getP_7 write setP_7;
    property P_8A: WideString read getP_8A write setP_8A;
    property P_8B: WideString read getP_8B write setP_8B;
    property P_9A: WideString read getP_9A write setP_9A;
    property P_9B: WideString read getP_9B write setP_9B;
    property P_10: WideString read getP_10 write setP_10;
    property P_11: WideString read getP_11 write setP_11;
    property P_11A: WideString read getP_11A write setP_11A;
    property P_12: WideString read getP_12 write setP_12;
  end;

{ IXMLFakturaWierszList }

  IXMLFakturaWierszList = interface(IXMLNodeCollection)
    ['{0BF2646A-5DA8-4A4F-9ABF-D54E9BB6A7A4}']
    { Methods & Properties }
    function Add: IXMLFakturaWiersz;
    function Insert(const Index: Integer): IXMLFakturaWiersz;
    function getItem(Index: Integer): IXMLFakturaWiersz;
    property Items[Index: Integer]: IXMLFakturaWiersz read getItem; default;
  end;

{ IXMLFakturaWierszCtrl }

  IXMLFakturaWierszCtrl = interface(IXMLNode)
    ['{782F3058-F4CA-4F72-98E6-2058F074E390}']
    { Property Accessors }
    function getLiczbaWierszyFaktur: WideString;
    function getWartoscWierszyFaktur: WideString;
    procedure setLiczbaWierszyFaktur(Value: WideString);
    procedure setWartoscWierszyFaktur(Value: WideString);
    { Methods & Properties }
    property LiczbaWierszyFaktur: WideString read getLiczbaWierszyFaktur write setLiczbaWierszyFaktur;
    property WartoscWierszyFaktur: WideString read getWartoscWierszyFaktur write setWartoscWierszyFaktur;
  end;

{ IXMLNaglowek }

  IXMLNaglowek = interface(IXMLTNaglowek)
    ['{0C640070-A19D-413A-9319-64C809875633}']
  end;

{ IXMLKodFormularza }

  IXMLKodFormularza = interface(IXMLNode)
    ['{4594516E-2965-44BE-8C95-FEDEE9782E83}']
    { Property Accessors }
    function getKodSystemowy: WideString;
    function getWersjaSchemy: WideString;
    procedure setKodSystemowy(Value: WideString);
    procedure setWersjaSchemy(Value: WideString);
    { Methods & Properties }
    property KodSystemowy: WideString read getKodSystemowy write setKodSystemowy;
    property WersjaSchemy: WideString read getWersjaSchemy write setWersjaSchemy;
  end;

{ Forward Decls }

  TXMLJPK = class;
  TXMLTNaglowek = class;
  TXMLPodmiot1 = class;
  TXMLTIdentyfikatorOsobyNiefizycznej = class;
  TXMLTAdresPolski = class;
  TXMLFaktura = class;
  TXMLFakturaList = class;
  TXMLFakturaCtrl = class;
  TXMLStawkiPodatku = class;
  TXMLFakturaWiersz = class;
  TXMLFakturaWierszList = class;
  TXMLFakturaWierszCtrl = class;
  TXMLNaglowek = class;
  TXMLKodFormularza = class;

{ TXMLJPK }

  TXMLJPK = class(TXMLNode, IXMLJPK)
  private
    FFaktura: IXMLFakturaList;
    FFakturaWiersz: IXMLFakturaWierszList;
  protected
    { IXMLJPK }
    function getNaglowek: IXMLNaglowek;
    function getPodmiot1: IXMLPodmiot1;
    function getFaktura: IXMLFakturaList;
    function getFakturaCtrl: IXMLFakturaCtrl;
    function getStawkiPodatku: IXMLStawkiPodatku;
    function getFakturaWiersz: IXMLFakturaWierszList;
    function getFakturaWierszCtrl: IXMLFakturaWierszCtrl;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNaglowek }

  TXMLTNaglowek = class(TXMLNode, IXMLTNaglowek)
  protected
    { IXMLTNaglowek }
    function getKodFormularza: IXMLKodFormularza;
    function getWariantFormularza: ShortInt;
    function getCelZlozenia: ShortInt;
    function getDataWytworzeniaJPK: WideString;
    function getDataOd: WideString;
    function getDataDo: WideString;
    function getDomyslnyKodWaluty: WideString;
    function getKodUrzedu: WideString;
    procedure setWariantFormularza(Value: ShortInt);
    procedure setCelZlozenia(Value: ShortInt);
    procedure setDataWytworzeniaJPK(Value: WideString);
    procedure setDataOd(Value: WideString);
    procedure setDataDo(Value: WideString);
    procedure setDomyslnyKodWaluty(Value: WideString);
    procedure setKodUrzedu(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPodmiot1 }

  TXMLPodmiot1 = class(TXMLNode, IXMLPodmiot1)
  protected
    { IXMLPodmiot1 }
    function getIdentyfikatorPodmiotu: IXMLTIdentyfikatorOsobyNiefizycznej;
    function getAdresPodmiotu: IXMLTAdresPolski;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTIdentyfikatorOsobyNiefizycznej }

  TXMLTIdentyfikatorOsobyNiefizycznej = class(TXMLNode, IXMLTIdentyfikatorOsobyNiefizycznej)
  protected
    { IXMLTIdentyfikatorOsobyNiefizycznej }
    function getNIP: WideString;
    function getPelnaNazwa: WideString;
    function getREGON: WideString;
    procedure setNIP(Value: WideString);
    procedure setPelnaNazwa(Value: WideString);
    procedure setREGON(Value: WideString);
  end;

{ TXMLTAdresPolski }

  TXMLTAdresPolski = class(TXMLNode, IXMLTAdresPolski)
  protected
    { IXMLTAdresPolski }
    function getKodKraju: WideString;
    function getWojewodztwo: WideString;
    function getPowiat: WideString;
    function getGmina: WideString;
    function getUlica: WideString;
    function getNrDomu: WideString;
    function getNrLokalu: WideString;
    function getMiejscowosc: WideString;
    function getKodPocztowy: WideString;
    function getPoczta: WideString;
    procedure setKodKraju(Value: WideString);
    procedure setWojewodztwo(Value: WideString);
    procedure setPowiat(Value: WideString);
    procedure setGmina(Value: WideString);
    procedure setUlica(Value: WideString);
    procedure setNrDomu(Value: WideString);
    procedure setNrLokalu(Value: WideString);
    procedure setMiejscowosc(Value: WideString);
    procedure setKodPocztowy(Value: WideString);
    procedure setPoczta(Value: WideString);
  end;

{ TXMLFaktura }

  TXMLFaktura = class(TXMLNode, IXMLFaktura)
  protected
    { IXMLFaktura }
    function getTyp: WideString;
    function getP_1: WideString;
    function getP_2A: WideString;
    function getP_3A: WideString;
    function getP_3B: WideString;
    function getP_3C: WideString;
    function getP_3D: WideString;
    function getP_4A: WideString;
    function getP_4B: WideString;
    function getP_5A: WideString;
    function getP_5B: WideString;
    function getP_6: WideString;
    function getP_13_1: WideString;
    function getP_14_1: WideString;
    function getP_13_2: WideString;
    function getP_14_2: WideString;
    function getP_13_3: WideString;
    function getP_14_3: WideString;
    function getP_13_4: WideString;
    function getP_14_4: WideString;
    function getP_13_5: WideString;
    function getP_14_5: WideString;
    function getP_13_6: WideString;
    function getP_13_7: WideString;
    function getP_15: WideString;
    function getP_16: Boolean;
    function getP_17: Boolean;
    function getP_18: Boolean;
    function getP_19: Boolean;
    function getP_19A: WideString;
    function getP_19B: WideString;
    function getP_19C: WideString;
    function getP_20: Boolean;
    function getP_20A: WideString;
    function getP_20B: WideString;
    function getP_21: Boolean;
    function getP_21A: WideString;
    function getP_21B: WideString;
    function getP_21C: WideString;
    function getP_22A: WideString;
    function getP_22B: WideString;
    function getP_22C: WideString;
    function getP_23: Boolean;
    function getP_106E_2: Boolean;
    function getP_106E_3: Boolean;
    function getP_106E_3A: WideString;
    function getRodzajFaktury: WideString;
    function getPrzyczynaKorekty: WideString;
    function getNrFaKorygowanej: WideString;
    function getOkresFaKorygowanej: WideString;
    function getZALZaplata: WideString;
    function getZALPodatek: WideString;
    procedure setTyp(Value: WideString);
    procedure setP_1(Value: WideString);
    procedure setP_2A(Value: WideString);
    procedure setP_3A(Value: WideString);
    procedure setP_3B(Value: WideString);
    procedure setP_3C(Value: WideString);
    procedure setP_3D(Value: WideString);
    procedure setP_4A(Value: WideString);
    procedure setP_4B(Value: WideString);
    procedure setP_5A(Value: WideString);
    procedure setP_5B(Value: WideString);
    procedure setP_6(Value: WideString);
    procedure setP_13_1(Value: WideString);
    procedure setP_14_1(Value: WideString);
    procedure setP_13_2(Value: WideString);
    procedure setP_14_2(Value: WideString);
    procedure setP_13_3(Value: WideString);
    procedure setP_14_3(Value: WideString);
    procedure setP_13_4(Value: WideString);
    procedure setP_14_4(Value: WideString);
    procedure setP_13_5(Value: WideString);
    procedure setP_14_5(Value: WideString);
    procedure setP_13_6(Value: WideString);
    procedure setP_13_7(Value: WideString);
    procedure setP_15(Value: WideString);
    procedure setP_16(Value: Boolean);
    procedure setP_17(Value: Boolean);
    procedure setP_18(Value: Boolean);
    procedure setP_19(Value: Boolean);
    procedure setP_19A(Value: WideString);
    procedure setP_19B(Value: WideString);
    procedure setP_19C(Value: WideString);
    procedure setP_20(Value: Boolean);
    procedure setP_20A(Value: WideString);
    procedure setP_20B(Value: WideString);
    procedure setP_21(Value: Boolean);
    procedure setP_21A(Value: WideString);
    procedure setP_21B(Value: WideString);
    procedure setP_21C(Value: WideString);
    procedure setP_22A(Value: WideString);
    procedure setP_22B(Value: WideString);
    procedure setP_22C(Value: WideString);
    procedure setP_23(Value: Boolean);
    procedure setP_106E_2(Value: Boolean);
    procedure setP_106E_3(Value: Boolean);
    procedure setP_106E_3A(Value: WideString);
    procedure setRodzajFaktury(Value: WideString);
    procedure setPrzyczynaKorekty(Value: WideString);
    procedure setNrFaKorygowanej(Value: WideString);
    procedure setOkresFaKorygowanej(Value: WideString);
    procedure setZALZaplata(Value: WideString);
    procedure setZALPodatek(Value: WideString);
  end;

{ TXMLFakturaList }

  TXMLFakturaList = class(TXMLNodeCollection, IXMLFakturaList)
  protected
    { IXMLFakturaList }
    function Add: IXMLFaktura;
    function Insert(const Index: Integer): IXMLFaktura;
    function getItem(Index: Integer): IXMLFaktura;
  end;

{ TXMLFakturaCtrl }

  TXMLFakturaCtrl = class(TXMLNode, IXMLFakturaCtrl)
  protected
    { IXMLFakturaCtrl }
    function getLiczbaFaktur: WideString;
    function getWartoscFaktur: WideString;
    procedure setLiczbaFaktur(Value: WideString);
    procedure setWartoscFaktur(Value: WideString);
  end;

{ TXMLStawkiPodatku }

  TXMLStawkiPodatku = class(TXMLNode, IXMLStawkiPodatku)
  protected
    { IXMLStawkiPodatku }
    function getStawka1: WideString;
    function getStawka2: WideString;
    function getStawka3: WideString;
    function getStawka4: WideString;
    function getStawka5: WideString;
    procedure setStawka1(Value: WideString);
    procedure setStawka2(Value: WideString);
    procedure setStawka3(Value: WideString);
    procedure setStawka4(Value: WideString);
    procedure setStawka5(Value: WideString);
  end;

{ TXMLFakturaWiersz }

  TXMLFakturaWiersz = class(TXMLNode, IXMLFakturaWiersz)
  protected
    { IXMLFakturaWiersz }
    function getTyp: WideString;
    function getP_2B: WideString;
    function getP_7: WideString;
    function getP_8A: WideString;
    function getP_8B: WideString;
    function getP_9A: WideString;
    function getP_9B: WideString;
    function getP_10: WideString;
    function getP_11: WideString;
    function getP_11A: WideString;
    function getP_12: WideString;
    procedure setTyp(Value: WideString);
    procedure setP_2B(Value: WideString);
    procedure setP_7(Value: WideString);
    procedure setP_8A(Value: WideString);
    procedure setP_8B(Value: WideString);
    procedure setP_9A(Value: WideString);
    procedure setP_9B(Value: WideString);
    procedure setP_10(Value: WideString);
    procedure setP_11(Value: WideString);
    procedure setP_11A(Value: WideString);
    procedure setP_12(Value: WideString);
  end;

{ TXMLFakturaWierszList }

  TXMLFakturaWierszList = class(TXMLNodeCollection, IXMLFakturaWierszList)
  protected
    { IXMLFakturaWierszList }
    function Add: IXMLFakturaWiersz;
    function Insert(const Index: Integer): IXMLFakturaWiersz;
    function getItem(Index: Integer): IXMLFakturaWiersz;
  end;

{ TXMLFakturaWierszCtrl }

  TXMLFakturaWierszCtrl = class(TXMLNode, IXMLFakturaWierszCtrl)
  protected
    { IXMLFakturaWierszCtrl }
    function getLiczbaWierszyFaktur: WideString;
    function getWartoscWierszyFaktur: WideString;
    procedure setLiczbaWierszyFaktur(Value: WideString);
    procedure setWartoscWierszyFaktur(Value: WideString);
  end;

{ TXMLNaglowek }

  TXMLNaglowek = class(TXMLTNaglowek, IXMLNaglowek)
  protected
    { IXMLNaglowek }
  end;

{ TXMLKodFormularza }

  TXMLKodFormularza = class(TXMLNode, IXMLKodFormularza)
  protected
    { IXMLKodFormularza }
    function getKodSystemowy: WideString;
    function getWersjaSchemy: WideString;
    procedure setKodSystemowy(Value: WideString);
    procedure setWersjaSchemy(Value: WideString);
  end;

{ Global Functions }

function GetJPK(Doc: IXMLDocument): IXMLJPK;
function LoadJPK(const FileName: WideString): IXMLJPK;
function NewJPK: IXMLJPK;

const
  TargetNamespace = 'http://jpk.mf.gov.pl/wzor/2016/03/09/03095/';

implementation

{ Global Functions }

function GetJPK(Doc: IXMLDocument): IXMLJPK;
begin
  Result := Doc.GetDocBinding('JPK', TXMLJPK, TargetNamespace) as IXMLJPK;
end;

function LoadJPK(const FileName: WideString): IXMLJPK;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('JPK', TXMLJPK, TargetNamespace) as IXMLJPK;
end;

function NewJPK: IXMLJPK;
begin
  Result := NewXMLDocument.GetDocBinding('JPK', TXMLJPK, TargetNamespace) as IXMLJPK;
end;

{ TXMLJPK }

procedure TXMLJPK.AfterConstruction;
begin
  RegisterChildNode('Naglowek', TXMLNaglowek);
  RegisterChildNode('Podmiot1', TXMLPodmiot1);
  RegisterChildNode('Faktura', TXMLFaktura);
  RegisterChildNode('FakturaCtrl', TXMLFakturaCtrl);
  RegisterChildNode('StawkiPodatku', TXMLStawkiPodatku);
  RegisterChildNode('FakturaWiersz', TXMLFakturaWiersz);
  RegisterChildNode('FakturaWierszCtrl', TXMLFakturaWierszCtrl);
  FFaktura := CreateCollection(TXMLFakturaList, IXMLFaktura, 'Faktura') as IXMLFakturaList;
  FFakturaWiersz := CreateCollection(TXMLFakturaWierszList, IXMLFakturaWiersz, 'FakturaWiersz') as IXMLFakturaWierszList;
  inherited;
end;

function TXMLJPK.getNaglowek: IXMLNaglowek;
begin
  Result := ChildNodes['Naglowek'] as IXMLNaglowek;
end;

function TXMLJPK.getPodmiot1: IXMLPodmiot1;
begin
  Result := ChildNodes['Podmiot1'] as IXMLPodmiot1;
end;

function TXMLJPK.getFaktura: IXMLFakturaList;
begin
  Result := FFaktura;
end;

function TXMLJPK.getFakturaCtrl: IXMLFakturaCtrl;
begin
  Result := ChildNodes['FakturaCtrl'] as IXMLFakturaCtrl;
end;

function TXMLJPK.getStawkiPodatku: IXMLStawkiPodatku;
begin
  Result := ChildNodes['StawkiPodatku'] as IXMLStawkiPodatku;
end;

function TXMLJPK.getFakturaWiersz: IXMLFakturaWierszList;
begin
  Result := FFakturaWiersz;
end;

function TXMLJPK.getFakturaWierszCtrl: IXMLFakturaWierszCtrl;
begin
  Result := ChildNodes['FakturaWierszCtrl'] as IXMLFakturaWierszCtrl;
end;

{ TXMLTNaglowek }

procedure TXMLTNaglowek.AfterConstruction;
begin
  RegisterChildNode('KodFormularza', TXMLKodFormularza);
  inherited;
end;

function TXMLTNaglowek.getKodFormularza: IXMLKodFormularza;
begin
  Result := ChildNodes['KodFormularza'] as IXMLKodFormularza;
end;

function TXMLTNaglowek.getWariantFormularza: ShortInt;
begin
  Result := ChildNodes['WariantFormularza'].NodeValue;
end;

procedure TXMLTNaglowek.setWariantFormularza(Value: ShortInt);
begin
  ChildNodes['WariantFormularza'].NodeValue := Value;
end;

function TXMLTNaglowek.getCelZlozenia: ShortInt;
begin
  Result := ChildNodes['CelZlozenia'].NodeValue;
end;

procedure TXMLTNaglowek.setCelZlozenia(Value: ShortInt);
begin
  ChildNodes['CelZlozenia'].NodeValue := Value;
end;

function TXMLTNaglowek.getDataWytworzeniaJPK: WideString;
begin
  Result := ChildNodes['DataWytworzeniaJPK'].Text;
end;

procedure TXMLTNaglowek.setDataWytworzeniaJPK(Value: WideString);
begin
  ChildNodes['DataWytworzeniaJPK'].NodeValue := Value;
end;

function TXMLTNaglowek.getDataOd: WideString;
begin
  Result := ChildNodes['DataOd'].Text;
end;

procedure TXMLTNaglowek.setDataOd(Value: WideString);
begin
  ChildNodes['DataOd'].NodeValue := Value;
end;

function TXMLTNaglowek.getDataDo: WideString;
begin
  Result := ChildNodes['DataDo'].Text;
end;

procedure TXMLTNaglowek.setDataDo(Value: WideString);
begin
  ChildNodes['DataDo'].NodeValue := Value;
end;

function TXMLTNaglowek.getDomyslnyKodWaluty: WideString;
begin
  Result := ChildNodes['DomyslnyKodWaluty'].Text;
end;

procedure TXMLTNaglowek.setDomyslnyKodWaluty(Value: WideString);
begin
  ChildNodes['DomyslnyKodWaluty'].NodeValue := Value;
end;

function TXMLTNaglowek.getKodUrzedu: WideString;
begin
  Result := ChildNodes['KodUrzedu'].Text;
end;

procedure TXMLTNaglowek.setKodUrzedu(Value: WideString);
begin
  ChildNodes['KodUrzedu'].NodeValue := Value;
end;

{ TXMLPodmiot1 }

procedure TXMLPodmiot1.AfterConstruction;
begin
  RegisterChildNode('IdentyfikatorPodmiotu', TXMLTIdentyfikatorOsobyNiefizycznej);
  RegisterChildNode('AdresPodmiotu', TXMLTAdresPolski);
  inherited;
end;

function TXMLPodmiot1.getIdentyfikatorPodmiotu: IXMLTIdentyfikatorOsobyNiefizycznej;
begin
  Result := ChildNodes['IdentyfikatorPodmiotu'] as IXMLTIdentyfikatorOsobyNiefizycznej;
end;

function TXMLPodmiot1.getAdresPodmiotu: IXMLTAdresPolski;
begin
  Result := ChildNodes['AdresPodmiotu'] as IXMLTAdresPolski;
end;

{ TXMLTIdentyfikatorOsobyNiefizycznej }

function TXMLTIdentyfikatorOsobyNiefizycznej.getNIP: WideString;
begin
  Result := ChildNodes['NIP'].Text;
end;

procedure TXMLTIdentyfikatorOsobyNiefizycznej.setNIP(Value: WideString);
begin
  ChildNodes['NIP'].NodeValue := Value;
end;

function TXMLTIdentyfikatorOsobyNiefizycznej.getPelnaNazwa: WideString;
begin
  Result := ChildNodes['PelnaNazwa'].Text;
end;

procedure TXMLTIdentyfikatorOsobyNiefizycznej.setPelnaNazwa(Value: WideString);
begin
  ChildNodes['PelnaNazwa'].NodeValue := Value;
end;

function TXMLTIdentyfikatorOsobyNiefizycznej.getREGON: WideString;
begin
  Result := ChildNodes['REGON'].Text;
end;

procedure TXMLTIdentyfikatorOsobyNiefizycznej.setREGON(Value: WideString);
begin
  ChildNodes['REGON'].NodeValue := Value;
end;

{ TXMLTAdresPolski }

function TXMLTAdresPolski.getKodKraju: WideString;
begin
  Result := ChildNodes['KodKraju'].Text;
end;

procedure TXMLTAdresPolski.setKodKraju(Value: WideString);
begin
  ChildNodes['KodKraju'].NodeValue := Value;
end;

function TXMLTAdresPolski.getWojewodztwo: WideString;
begin
  Result := ChildNodes['Wojewodztwo'].Text;
end;

procedure TXMLTAdresPolski.setWojewodztwo(Value: WideString);
begin
  ChildNodes['Wojewodztwo'].NodeValue := Value;
end;

function TXMLTAdresPolski.getPowiat: WideString;
begin
  Result := ChildNodes['Powiat'].Text;
end;

procedure TXMLTAdresPolski.setPowiat(Value: WideString);
begin
  ChildNodes['Powiat'].NodeValue := Value;
end;

function TXMLTAdresPolski.getGmina: WideString;
begin
  Result := ChildNodes['Gmina'].Text;
end;

procedure TXMLTAdresPolski.setGmina(Value: WideString);
begin
  ChildNodes['Gmina'].NodeValue := Value;
end;

function TXMLTAdresPolski.getUlica: WideString;
begin
  Result := ChildNodes['Ulica'].Text;
end;

procedure TXMLTAdresPolski.setUlica(Value: WideString);
begin
  ChildNodes['Ulica'].NodeValue := Value;
end;

function TXMLTAdresPolski.getNrDomu: WideString;
begin
  Result := ChildNodes['NrDomu'].Text;
end;

procedure TXMLTAdresPolski.setNrDomu(Value: WideString);
begin
  ChildNodes['NrDomu'].NodeValue := Value;
end;

function TXMLTAdresPolski.getNrLokalu: WideString;
begin
  Result := ChildNodes['NrLokalu'].Text;
end;

procedure TXMLTAdresPolski.setNrLokalu(Value: WideString);
begin
  ChildNodes['NrLokalu'].NodeValue := Value;
end;

function TXMLTAdresPolski.getMiejscowosc: WideString;
begin
  Result := ChildNodes['Miejscowosc'].Text;
end;

procedure TXMLTAdresPolski.setMiejscowosc(Value: WideString);
begin
  ChildNodes['Miejscowosc'].NodeValue := Value;
end;

function TXMLTAdresPolski.getKodPocztowy: WideString;
begin
  Result := ChildNodes['KodPocztowy'].Text;
end;

procedure TXMLTAdresPolski.setKodPocztowy(Value: WideString);
begin
  ChildNodes['KodPocztowy'].NodeValue := Value;
end;

function TXMLTAdresPolski.getPoczta: WideString;
begin
  Result := ChildNodes['Poczta'].Text;
end;

procedure TXMLTAdresPolski.setPoczta(Value: WideString);
begin
  ChildNodes['Poczta'].NodeValue := Value;
end;

{ TXMLFaktura }

function TXMLFaktura.getTyp: WideString;
begin
  Result := AttributeNodes['typ'].Text;
end;

procedure TXMLFaktura.setTyp(Value: WideString);
begin
  SetAttribute('typ', Value);
end;

function TXMLFaktura.getP_1: WideString;
begin
  Result := ChildNodes['P_1'].Text;
end;

procedure TXMLFaktura.setP_1(Value: WideString);
begin
  ChildNodes['P_1'].NodeValue := Value;
end;

function TXMLFaktura.getP_2A: WideString;
begin
  Result := ChildNodes['P_2A'].Text;
end;

procedure TXMLFaktura.setP_2A(Value: WideString);
begin
  ChildNodes['P_2A'].NodeValue := Value;
end;

function TXMLFaktura.getP_3A: WideString;
begin
  Result := ChildNodes['P_3A'].Text;
end;

procedure TXMLFaktura.setP_3A(Value: WideString);
begin
  ChildNodes['P_3A'].NodeValue := Value;
end;

function TXMLFaktura.getP_3B: WideString;
begin
  Result := ChildNodes['P_3B'].Text;
end;

procedure TXMLFaktura.setP_3B(Value: WideString);
begin
  ChildNodes['P_3B'].NodeValue := Value;
end;

function TXMLFaktura.getP_3C: WideString;
begin
  Result := ChildNodes['P_3C'].Text;
end;

procedure TXMLFaktura.setP_3C(Value: WideString);
begin
  ChildNodes['P_3C'].NodeValue := Value;
end;

function TXMLFaktura.getP_3D: WideString;
begin
  Result := ChildNodes['P_3D'].Text;
end;

procedure TXMLFaktura.setP_3D(Value: WideString);
begin
  ChildNodes['P_3D'].NodeValue := Value;
end;

function TXMLFaktura.getP_4A: WideString;
begin
  Result := ChildNodes['P_4A'].Text;
end;

procedure TXMLFaktura.setP_4A(Value: WideString);
begin
  ChildNodes['P_4A'].NodeValue := Value;
end;

function TXMLFaktura.getP_4B: WideString;
begin
  Result := ChildNodes['P_4B'].Text;
end;

procedure TXMLFaktura.setP_4B(Value: WideString);
begin
  ChildNodes['P_4B'].NodeValue := Value;
end;

function TXMLFaktura.getP_5A: WideString;
begin
  Result := ChildNodes['P_5A'].Text;
end;

procedure TXMLFaktura.setP_5A(Value: WideString);
begin
  ChildNodes['P_5A'].NodeValue := Value;
end;

function TXMLFaktura.getP_5B: WideString;
begin
  Result := ChildNodes['P_5B'].Text;
end;

procedure TXMLFaktura.setP_5B(Value: WideString);
begin
  ChildNodes['P_5B'].NodeValue := Value;
end;

function TXMLFaktura.getP_6: WideString;
begin
  Result := ChildNodes['P_6'].Text;
end;

procedure TXMLFaktura.setP_6(Value: WideString);
begin
  ChildNodes['P_6'].NodeValue := Value;
end;

function TXMLFaktura.getP_13_1: WideString;
begin
  Result := ChildNodes['P_13_1'].Text;
end;

procedure TXMLFaktura.setP_13_1(Value: WideString);
begin
  ChildNodes['P_13_1'].NodeValue := Value;
end;

function TXMLFaktura.getP_14_1: WideString;
begin
  Result := ChildNodes['P_14_1'].Text;
end;

procedure TXMLFaktura.setP_14_1(Value: WideString);
begin
  ChildNodes['P_14_1'].NodeValue := Value;
end;

function TXMLFaktura.getP_13_2: WideString;
begin
  Result := ChildNodes['P_13_2'].Text;
end;

procedure TXMLFaktura.setP_13_2(Value: WideString);
begin
  ChildNodes['P_13_2'].NodeValue := Value;
end;

function TXMLFaktura.getP_14_2: WideString;
begin
  Result := ChildNodes['P_14_2'].Text;
end;

procedure TXMLFaktura.setP_14_2(Value: WideString);
begin
  ChildNodes['P_14_2'].NodeValue := Value;
end;

function TXMLFaktura.getP_13_3: WideString;
begin
  Result := ChildNodes['P_13_3'].Text;
end;

procedure TXMLFaktura.setP_13_3(Value: WideString);
begin
  ChildNodes['P_13_3'].NodeValue := Value;
end;

function TXMLFaktura.getP_14_3: WideString;
begin
  Result := ChildNodes['P_14_3'].Text;
end;

procedure TXMLFaktura.setP_14_3(Value: WideString);
begin
  ChildNodes['P_14_3'].NodeValue := Value;
end;

function TXMLFaktura.getP_13_4: WideString;
begin
  Result := ChildNodes['P_13_4'].Text;
end;

procedure TXMLFaktura.setP_13_4(Value: WideString);
begin
  ChildNodes['P_13_4'].NodeValue := Value;
end;

function TXMLFaktura.getP_14_4: WideString;
begin
  Result := ChildNodes['P_14_4'].Text;
end;

procedure TXMLFaktura.setP_14_4(Value: WideString);
begin
  ChildNodes['P_14_4'].NodeValue := Value;
end;

function TXMLFaktura.getP_13_5: WideString;
begin
  Result := ChildNodes['P_13_5'].Text;
end;

procedure TXMLFaktura.setP_13_5(Value: WideString);
begin
  ChildNodes['P_13_5'].NodeValue := Value;
end;

function TXMLFaktura.getP_14_5: WideString;
begin
  Result := ChildNodes['P_14_5'].Text;
end;

procedure TXMLFaktura.setP_14_5(Value: WideString);
begin
  ChildNodes['P_14_5'].NodeValue := Value;
end;

function TXMLFaktura.getP_13_6: WideString;
begin
  Result := ChildNodes['P_13_6'].Text;
end;

procedure TXMLFaktura.setP_13_6(Value: WideString);
begin
  ChildNodes['P_13_6'].NodeValue := Value;
end;

function TXMLFaktura.getP_13_7: WideString;
begin
  Result := ChildNodes['P_13_7'].Text;
end;

procedure TXMLFaktura.setP_13_7(Value: WideString);
begin
  ChildNodes['P_13_7'].NodeValue := Value;
end;

function TXMLFaktura.getP_15: WideString;
begin
  Result := ChildNodes['P_15'].Text;
end;

procedure TXMLFaktura.setP_15(Value: WideString);
begin
  ChildNodes['P_15'].NodeValue := Value;
end;

function TXMLFaktura.getP_16: Boolean;
begin
  Result := ChildNodes['P_16'].NodeValue;
end;

procedure TXMLFaktura.setP_16(Value: Boolean);
begin
  ChildNodes['P_16'].NodeValue := Value;
end;

function TXMLFaktura.getP_17: Boolean;
begin
  Result := ChildNodes['P_17'].NodeValue;
end;

procedure TXMLFaktura.setP_17(Value: Boolean);
begin
  ChildNodes['P_17'].NodeValue := Value;
end;

function TXMLFaktura.getP_18: Boolean;
begin
  Result := ChildNodes['P_18'].NodeValue;
end;

procedure TXMLFaktura.setP_18(Value: Boolean);
begin
  ChildNodes['P_18'].NodeValue := Value;
end;

function TXMLFaktura.getP_19: Boolean;
begin
  Result := ChildNodes['P_19'].NodeValue;
end;

procedure TXMLFaktura.setP_19(Value: Boolean);
begin
  ChildNodes['P_19'].NodeValue := Value;
end;

function TXMLFaktura.getP_19A: WideString;
begin
  Result := ChildNodes['P_19A'].Text;
end;

procedure TXMLFaktura.setP_19A(Value: WideString);
begin
  ChildNodes['P_19A'].NodeValue := Value;
end;

function TXMLFaktura.getP_19B: WideString;
begin
  Result := ChildNodes['P_19B'].Text;
end;

procedure TXMLFaktura.setP_19B(Value: WideString);
begin
  ChildNodes['P_19B'].NodeValue := Value;
end;

function TXMLFaktura.getP_19C: WideString;
begin
  Result := ChildNodes['P_19C'].Text;
end;

procedure TXMLFaktura.setP_19C(Value: WideString);
begin
  ChildNodes['P_19C'].NodeValue := Value;
end;

function TXMLFaktura.getP_20: Boolean;
begin
  Result := ChildNodes['P_20'].NodeValue;
end;

procedure TXMLFaktura.setP_20(Value: Boolean);
begin
  ChildNodes['P_20'].NodeValue := Value;
end;

function TXMLFaktura.getP_20A: WideString;
begin
  Result := ChildNodes['P_20A'].Text;
end;

procedure TXMLFaktura.setP_20A(Value: WideString);
begin
  ChildNodes['P_20A'].NodeValue := Value;
end;

function TXMLFaktura.getP_20B: WideString;
begin
  Result := ChildNodes['P_20B'].Text;
end;

procedure TXMLFaktura.setP_20B(Value: WideString);
begin
  ChildNodes['P_20B'].NodeValue := Value;
end;

function TXMLFaktura.getP_21: Boolean;
begin
  Result := ChildNodes['P_21'].NodeValue;
end;

procedure TXMLFaktura.setP_21(Value: Boolean);
begin
  ChildNodes['P_21'].NodeValue := Value;
end;

function TXMLFaktura.getP_21A: WideString;
begin
  Result := ChildNodes['P_21A'].Text;
end;

procedure TXMLFaktura.setP_21A(Value: WideString);
begin
  ChildNodes['P_21A'].NodeValue := Value;
end;

function TXMLFaktura.getP_21B: WideString;
begin
  Result := ChildNodes['P_21B'].Text;
end;

procedure TXMLFaktura.setP_21B(Value: WideString);
begin
  ChildNodes['P_21B'].NodeValue := Value;
end;

function TXMLFaktura.getP_21C: WideString;
begin
  Result := ChildNodes['P_21C'].Text;
end;

procedure TXMLFaktura.setP_21C(Value: WideString);
begin
  ChildNodes['P_21C'].NodeValue := Value;
end;

function TXMLFaktura.getP_22A: WideString;
begin
  Result := ChildNodes['P_22A'].Text;
end;

procedure TXMLFaktura.setP_22A(Value: WideString);
begin
  ChildNodes['P_22A'].NodeValue := Value;
end;

function TXMLFaktura.getP_22B: WideString;
begin
  Result := ChildNodes['P_22B'].Text;
end;

procedure TXMLFaktura.setP_22B(Value: WideString);
begin
  ChildNodes['P_22B'].NodeValue := Value;
end;

function TXMLFaktura.getP_22C: WideString;
begin
  Result := ChildNodes['P_22C'].Text;
end;

procedure TXMLFaktura.setP_22C(Value: WideString);
begin
  ChildNodes['P_22C'].NodeValue := Value;
end;

function TXMLFaktura.getP_23: Boolean;
begin
  Result := ChildNodes['P_23'].NodeValue;
end;

procedure TXMLFaktura.setP_23(Value: Boolean);
begin
  ChildNodes['P_23'].NodeValue := Value;
end;

function TXMLFaktura.getP_106E_2: Boolean;
begin
  Result := ChildNodes['P_106E_2'].NodeValue;
end;

procedure TXMLFaktura.setP_106E_2(Value: Boolean);
begin
  ChildNodes['P_106E_2'].NodeValue := Value;
end;

function TXMLFaktura.getP_106E_3: Boolean;
begin
  Result := ChildNodes['P_106E_3'].NodeValue;
end;

procedure TXMLFaktura.setP_106E_3(Value: Boolean);
begin
  ChildNodes['P_106E_3'].NodeValue := Value;
end;

function TXMLFaktura.getP_106E_3A: WideString;
begin
  Result := ChildNodes['P_106E_3A'].Text;
end;

procedure TXMLFaktura.setP_106E_3A(Value: WideString);
begin
  ChildNodes['P_106E_3A'].NodeValue := Value;
end;

function TXMLFaktura.getRodzajFaktury: WideString;
begin
  Result := ChildNodes['RodzajFaktury'].Text;
end;

procedure TXMLFaktura.setRodzajFaktury(Value: WideString);
begin
  ChildNodes['RodzajFaktury'].NodeValue := Value;
end;

function TXMLFaktura.getPrzyczynaKorekty: WideString;
begin
  Result := ChildNodes['PrzyczynaKorekty'].Text;
end;

procedure TXMLFaktura.setPrzyczynaKorekty(Value: WideString);
begin
  ChildNodes['PrzyczynaKorekty'].NodeValue := Value;
end;

function TXMLFaktura.getNrFaKorygowanej: WideString;
begin
  Result := ChildNodes['NrFaKorygowanej'].Text;
end;

procedure TXMLFaktura.setNrFaKorygowanej(Value: WideString);
begin
  ChildNodes['NrFaKorygowanej'].NodeValue := Value;
end;

function TXMLFaktura.getOkresFaKorygowanej: WideString;
begin
  Result := ChildNodes['OkresFaKorygowanej'].Text;
end;

procedure TXMLFaktura.setOkresFaKorygowanej(Value: WideString);
begin
  ChildNodes['OkresFaKorygowanej'].NodeValue := Value;
end;

function TXMLFaktura.getZALZaplata: WideString;
begin
  Result := ChildNodes['ZALZaplata'].Text;
end;

procedure TXMLFaktura.setZALZaplata(Value: WideString);
begin
  ChildNodes['ZALZaplata'].NodeValue := Value;
end;

function TXMLFaktura.getZALPodatek: WideString;
begin
  Result := ChildNodes['ZALPodatek'].Text;
end;

procedure TXMLFaktura.setZALPodatek(Value: WideString);
begin
  ChildNodes['ZALPodatek'].NodeValue := Value;
end;

{ TXMLFakturaList }

function TXMLFakturaList.Add: IXMLFaktura;
begin
  Result := AddItem(-1) as IXMLFaktura;
end;

function TXMLFakturaList.Insert(const Index: Integer): IXMLFaktura;
begin
  Result := AddItem(Index) as IXMLFaktura;
end;
function TXMLFakturaList.getItem(Index: Integer): IXMLFaktura;
begin
  Result := List[Index] as IXMLFaktura;
end;

{ TXMLFakturaCtrl }

function TXMLFakturaCtrl.getLiczbaFaktur: WideString;
begin
  Result := ChildNodes['LiczbaFaktur'].Text;
end;

procedure TXMLFakturaCtrl.setLiczbaFaktur(Value: WideString);
begin
  ChildNodes['LiczbaFaktur'].NodeValue := Value;
end;

function TXMLFakturaCtrl.getWartoscFaktur: WideString;
begin
  Result := ChildNodes['WartoscFaktur'].Text;
end;

procedure TXMLFakturaCtrl.setWartoscFaktur(Value: WideString);
begin
  ChildNodes['WartoscFaktur'].NodeValue := Value;
end;

{ TXMLStawkiPodatku }

function TXMLStawkiPodatku.getStawka1: WideString;
begin
  Result := ChildNodes['Stawka1'].Text;
end;

procedure TXMLStawkiPodatku.setStawka1(Value: WideString);
begin
  ChildNodes['Stawka1'].NodeValue := Value;
end;

function TXMLStawkiPodatku.getStawka2: WideString;
begin
  Result := ChildNodes['Stawka2'].Text;
end;

procedure TXMLStawkiPodatku.setStawka2(Value: WideString);
begin
  ChildNodes['Stawka2'].NodeValue := Value;
end;

function TXMLStawkiPodatku.getStawka3: WideString;
begin
  Result := ChildNodes['Stawka3'].Text;
end;

procedure TXMLStawkiPodatku.setStawka3(Value: WideString);
begin
  ChildNodes['Stawka3'].NodeValue := Value;
end;

function TXMLStawkiPodatku.getStawka4: WideString;
begin
  Result := ChildNodes['Stawka4'].Text;
end;

procedure TXMLStawkiPodatku.setStawka4(Value: WideString);
begin
  ChildNodes['Stawka4'].NodeValue := Value;
end;

function TXMLStawkiPodatku.getStawka5: WideString;
begin
  Result := ChildNodes['Stawka5'].Text;
end;

procedure TXMLStawkiPodatku.setStawka5(Value: WideString);
begin
  ChildNodes['Stawka5'].NodeValue := Value;
end;

{ TXMLFakturaWiersz }

function TXMLFakturaWiersz.getTyp: WideString;
begin
  Result := AttributeNodes['typ'].Text;
end;

procedure TXMLFakturaWiersz.setTyp(Value: WideString);
begin
  SetAttribute('typ', Value);
end;

function TXMLFakturaWiersz.getP_2B: WideString;
begin
  Result := ChildNodes['P_2B'].Text;
end;

procedure TXMLFakturaWiersz.setP_2B(Value: WideString);
begin
  ChildNodes['P_2B'].NodeValue := Value;
end;

function TXMLFakturaWiersz.getP_7: WideString;
begin
  Result := ChildNodes['P_7'].Text;
end;

procedure TXMLFakturaWiersz.setP_7(Value: WideString);
begin
  ChildNodes['P_7'].NodeValue := Value;
end;

function TXMLFakturaWiersz.getP_8A: WideString;
begin
  Result := ChildNodes['P_8A'].Text;
end;

procedure TXMLFakturaWiersz.setP_8A(Value: WideString);
begin
  ChildNodes['P_8A'].NodeValue := Value;
end;

function TXMLFakturaWiersz.getP_8B: WideString;
begin
  Result := ChildNodes['P_8B'].Text;
end;

procedure TXMLFakturaWiersz.setP_8B(Value: WideString);
begin
  ChildNodes['P_8B'].NodeValue := Value;
end;

function TXMLFakturaWiersz.getP_9A: WideString;
begin
  Result := ChildNodes['P_9A'].Text;
end;

procedure TXMLFakturaWiersz.setP_9A(Value: WideString);
begin
  ChildNodes['P_9A'].NodeValue := Value;
end;

function TXMLFakturaWiersz.getP_9B: WideString;
begin
  Result := ChildNodes['P_9B'].Text;
end;

procedure TXMLFakturaWiersz.setP_9B(Value: WideString);
begin
  ChildNodes['P_9B'].NodeValue := Value;
end;

function TXMLFakturaWiersz.getP_10: WideString;
begin
  Result := ChildNodes['P_10'].Text;
end;

procedure TXMLFakturaWiersz.setP_10(Value: WideString);
begin
  ChildNodes['P_10'].NodeValue := Value;
end;

function TXMLFakturaWiersz.getP_11: WideString;
begin
  Result := ChildNodes['P_11'].Text;
end;

procedure TXMLFakturaWiersz.setP_11(Value: WideString);
begin
  ChildNodes['P_11'].NodeValue := Value;
end;

function TXMLFakturaWiersz.getP_11A: WideString;
begin
  Result := ChildNodes['P_11A'].Text;
end;

procedure TXMLFakturaWiersz.setP_11A(Value: WideString);
begin
  ChildNodes['P_11A'].NodeValue := Value;
end;

function TXMLFakturaWiersz.getP_12: WideString;
begin
  Result := ChildNodes['P_12'].Text;
end;

procedure TXMLFakturaWiersz.setP_12(Value: WideString);
begin
  ChildNodes['P_12'].NodeValue := Value;
end;

{ TXMLFakturaWierszList }

function TXMLFakturaWierszList.Add: IXMLFakturaWiersz;
begin
  Result := AddItem(-1) as IXMLFakturaWiersz;
end;

function TXMLFakturaWierszList.Insert(const Index: Integer): IXMLFakturaWiersz;
begin
  Result := AddItem(Index) as IXMLFakturaWiersz;
end;
function TXMLFakturaWierszList.getItem(Index: Integer): IXMLFakturaWiersz;
begin
  Result := List[Index] as IXMLFakturaWiersz;
end;

{ TXMLFakturaWierszCtrl }

function TXMLFakturaWierszCtrl.getLiczbaWierszyFaktur: WideString;
begin
  Result := ChildNodes['LiczbaWierszyFaktur'].Text;
end;

procedure TXMLFakturaWierszCtrl.setLiczbaWierszyFaktur(Value: WideString);
begin
  ChildNodes['LiczbaWierszyFaktur'].NodeValue := Value;
end;

function TXMLFakturaWierszCtrl.getWartoscWierszyFaktur: WideString;
begin
  Result := ChildNodes['WartoscWierszyFaktur'].Text;
end;

procedure TXMLFakturaWierszCtrl.setWartoscWierszyFaktur(Value: WideString);
begin
  ChildNodes['WartoscWierszyFaktur'].NodeValue := Value;
end;

{ TXMLNaglowek }

{ TXMLKodFormularza }

function TXMLKodFormularza.getKodSystemowy: WideString;
begin
  Result := AttributeNodes['kodSystemowy'].Text;
end;

procedure TXMLKodFormularza.setKodSystemowy(Value: WideString);
begin
  SetAttribute('kodSystemowy', Value);
end;

function TXMLKodFormularza.getWersjaSchemy: WideString;
begin
  Result := AttributeNodes['wersjaSchemy'].Text;
end;

procedure TXMLKodFormularza.setWersjaSchemy(Value: WideString);
begin
  SetAttribute('wersjaSchemy', Value);
end;

end.