
{************************************************************************}
{                                                                        }
{                            XML Data Binding                            }
{                                                                        }
{         Generated on: 13.06.2018 22:36:23                              }
{       Generated from: C:\Users\Krystian\Downloads\FV\data_schema.xml   }
{   Settings stored in: C:\Users\Krystian\Downloads\FV\data_schema.xdb   }
{                                                                        }
{************************************************************************}

unit app_schema;

interface

uses Variants, xmldom, XMLDoc, XMLIntf, SysUtils;

type

{ Forward Decls }

  IXMLAplikacjaType = interface;
  IXMLKlienciType = interface;
  IXMLKlientType = interface;
  IXMLSprzedawcyType = interface;
  IXMLSprzedawcaType = interface;
  IXMLFakturyType = interface;
  IXMLFakturaType = interface;
  IXMLKursType = interface;
  IXMLTowaryType = interface;
  IXMLTowarType = interface;
  IXMLKonfiguracjaType = interface;

{ IXMLAplikacjaType }

  IXMLAplikacjaType = interface(IXMLNode)
    ['{B389204E-CCBB-45D1-9F64-D74D4E02F861}']
    { Property Accessors }
    function getKlienci: IXMLKlienciType;
    function getSprzedawcy: IXMLSprzedawcyType;
    function getFaktury: IXMLFakturyType;
    function getKonfiguracja: IXMLKonfiguracjaType;
    { Methods & Properties }
    property Klienci: IXMLKlienciType read getKlienci;
    property Sprzedawcy: IXMLSprzedawcyType read getSprzedawcy;
    property Faktury: IXMLFakturyType read getFaktury;
    property Konfiguracja: IXMLKonfiguracjaType read getKonfiguracja;
  end;

{ IXMLKlienciType }

  IXMLKlienciType = interface(IXMLNodeCollection)
    ['{8B8472A1-900F-4E39-B5A2-E2927CB8985B}']
    { Property Accessors }
    function getKlient(Index: Integer): IXMLKlientType;
    { Methods & Properties }
    function Add: IXMLKlientType;
    function Insert(const Index: Integer): IXMLKlientType;
    property Klient[Index: Integer]: IXMLKlientType read getKlient; default;
  end;

{ IXMLKlientType }

  IXMLKlientType = interface(IXMLNode)
    ['{53621094-F904-4B72-A86A-6D7AF8B58238}']
    { Property Accessors }
    function getIdentyf: WideString;
    function getNazwa1: WideString;
    function getNazwa2: WideString;
    function getNIP: WideString;
    function getKod: WideString;
    function getMiasto: WideString;
    function getUlica: WideString;
    function getNrDomu: WideString;
    function getWojew: Byte;
    function getOddzial: WideString;
    function getNBanku1: WideString;
    function getNrKonta1: WideString;
    function getNBanku2: WideString;
    function getNrKonta2: WideString;
    function getUwagi: WideString;
    function isDeleted: Boolean;
    procedure setIdentyf(Value: WideString);
    procedure setNazwa1(Value: WideString);
    procedure setNazwa2(Value: WideString);
    procedure setNIP(Value: WideString);
    procedure setKod(Value: WideString);
    procedure setMiasto(Value: WideString);
    procedure setUlica(Value: WideString);
    procedure setNrDomu(Value: WideString);
    procedure setWojew(Value: Byte);
    procedure setOddzial(Value: WideString);
    procedure setNBanku1(Value: WideString);
    procedure setNrKonta1(Value: WideString);
    procedure setNBanku2(Value: WideString);
    procedure setNrKonta2(Value: WideString);
    procedure setUwagi(Value: WideString);
    procedure setDeleted(Value: Boolean);
    { Methods & Properties }
    property Identyf: WideString read getIdentyf write setIdentyf;
    property Nazwa1: WideString read getNazwa1 write setNazwa1;
    property Nazwa2: WideString read getNazwa2 write setNazwa2;
    property NIP: WideString read getNIP write setNIP;
    property Kod: WideString read getKod write setKod;
    property Miasto: WideString read getMiasto write setMiasto;
    property Ulica: WideString read getUlica write setUlica;
    property NrDomu: WideString read getNrDomu write setNrDomu;
    property Wojew: Byte read getWojew write setWojew;
    property Oddzial: WideString read getOddzial write setOddzial;
    property NBanku1: WideString read getNBanku1 write setNBanku1;
    property NrKonta1: WideString read getNrKonta1 write setNrKonta1;
    property NBanku2: WideString read getNBanku2 write setNBanku2;
    property NrKonta2: WideString read getNrKonta2 write setNrKonta2;
    property Uwagi: WideString read getUwagi write setUwagi;
    property Deleted: Boolean read isDeleted write setDeleted;
  end;

{ IXMLSprzedawcyType }

  IXMLSprzedawcyType = interface(IXMLNodeCollection)
    ['{FF7C95B2-5A17-4B41-9AF7-8BAD62B95097}']
    { Property Accessors }
    function getSprzedawca(Index: Integer): IXMLSprzedawcaType;
    { Methods & Properties }
    function Add: IXMLSprzedawcaType;
    function Insert(const Index: Integer): IXMLSprzedawcaType;
    property Sprzedawca[Index: Integer]: IXMLSprzedawcaType read getSprzedawca; default;
  end;

{ IXMLSprzedawcaType }

  IXMLSprzedawcaType = interface(IXMLNode)
    ['{7C1C1BC5-458D-4ACA-AFFE-F4E452214791}']
    { Property Accessors }
    function getIdentyf: WideString;
    function getNazwa1: WideString;
    function getNazwa2: WideString;
    function getNIP: WideString;
    function getKod: WideString;
    function getMiasto: WideString;
    function getUlica: WideString;
    function getNrDomu: WideString;
    function getWojew: Byte;
    function getOddzial: WideString;
    function getNBanku1: WideString;
    function getNrKonta1: WideString;
    function getNBanku2: WideString;
    function getNrKonta2: WideString;
    function getUwagi: WideString;
    function isDeleted: Boolean;
    procedure setIdentyf(Value: WideString);
    procedure setNazwa1(Value: WideString);
    procedure setNazwa2(Value: WideString);
    procedure setNIP(Value: WideString);
    procedure setKod(Value: WideString);
    procedure setMiasto(Value: WideString);
    procedure setUlica(Value: WideString);
    procedure setNrDomu(Value: WideString);
    procedure setWojew(Value: Byte);
    procedure setOddzial(Value: WideString);
    procedure setNBanku1(Value: WideString);
    procedure setNrKonta1(Value: WideString);
    procedure setNBanku2(Value: WideString);
    procedure setNrKonta2(Value: WideString);
    procedure setUwagi(Value: WideString);
    procedure setDeleted(Value: Boolean);
    { Methods & Properties }
    property Identyf: WideString read getIdentyf write setIdentyf;
    property Nazwa1: WideString read getNazwa1 write setNazwa1;
    property Nazwa2: WideString read getNazwa2 write setNazwa2;
    property NIP: WideString read getNIP write setNIP;
    property Kod: WideString read getKod write setKod;
    property Miasto: WideString read getMiasto write setMiasto;
    property Ulica: WideString read getUlica write setUlica;
    property NrDomu: WideString read getNrDomu write setNrDomu;
    property Wojew: Byte read getWojew write setWojew;
    property Oddzial: WideString read getOddzial write setOddzial;
    property NBanku1: WideString read getNBanku1 write setNBanku1;
    property NrKonta1: WideString read getNrKonta1 write setNrKonta1;
    property NBanku2: WideString read getNBanku2 write setNBanku2;
    property NrKonta2: WideString read getNrKonta2 write setNrKonta2;
    property Uwagi: WideString read getUwagi write setUwagi; 
    property Deleted: Boolean read isDeleted write setDeleted;
  end;

{ IXMLFakturyType }

  IXMLFakturyType = interface(IXMLNodeCollection)
    ['{96E1E7CB-DF71-4EA4-8BC7-A2582BAAE68C}']
    { Property Accessors }
    function getFaktura(Index: Integer): IXMLFakturaType;
    { Methods & Properties }
    function Add: IXMLFakturaType;
    function Insert(const Index: Integer): IXMLFakturaType;
    property Faktura[Index: Integer]: IXMLFakturaType read getFaktura; default;
  end;

{ IXMLFakturaType }

  IXMLFakturaType = interface(IXMLNode)
    ['{7B5DD1B2-0197-4820-8C15-15D41990FD28}']
    { Property Accessors }
    function getKlient: IXMLKlientType;
    function getSprzedawca: IXMLSprzedawcaType;
    function getMiejsc: WideString;
    function getDataDok: TDateTime;
    function getTypFak: WideString;
    function getNrFak: WideString;
    function getTypDok: WideString;
    function getDataSprzed: TDateTime;
    function getSposZapl: WideString;
    function getTermPlat: TDateTime;
    function getTransport: WideString;
    function getUwagi: WideString;
    function getKurs: IXMLKursType;
    function getTowary: IXMLTowaryType; 
    function isDeleted: Boolean;
    procedure setMiejsc(Value: WideString);
    procedure setDataDok(Value: TDateTime);
    procedure setTypFak(Value: WideString);
    procedure setNrFak(Value: WideString);
    procedure setTypDok(Value: WideString);
    procedure setDataSprzed(Value: TDateTime);
    procedure setSposZapl(Value: WideString);
    procedure setTermPlat(Value: TDateTime);
    procedure setTransport(Value: WideString);
    procedure setUwagi(Value: WideString);   
    procedure setDeleted(Value: Boolean);
    { Methods & Properties }

    property Klient: IXMLKlientType read getKlient;
    property Sprzedawca: IXMLSprzedawcaType read getSprzedawca;
    property Miejsc: WideString read getMiejsc write setMiejsc;
    property DataDok: TDateTime read getDataDok write setDataDok;
    property TypFak: WideString read getTypFak write setTypFak;
    property NrFak: WideString read getNrFak write setNrFak;
    property TypDok: WideString read getTypDok write setTypDok;
    property DataSprzed: TDateTime read getDataSprzed write setDataSprzed;
    property SposZapl: WideString read getSposZapl write setSposZapl;
    property TermPlat: TDateTime read getTermPlat write setTermPlat;
    property Transport: WideString read getTransport write setTransport;
    property Uwagi: WideString read getUwagi write setUwagi;
    property Kurs: IXMLKursType read getKurs;
    property Towary: IXMLTowaryType read getTowary;  
    property Deleted: Boolean read isDeleted write setDeleted;
  end;

{ IXMLKursType }

  IXMLKursType = interface(IXMLNode)
    ['{5978A2A0-CCBF-40A4-B047-F16DF02896E9}']
    { Property Accessors }
    function getEuro: Boolean;
    function getKurs: double;
    function getData: TDateTime;
    function getNrTab: WideString;
    procedure setEuro(Value: Boolean);
    procedure setKurs(Value: double);
    procedure setData(Value: TDateTime);
    procedure setNrTab(Value: WideString);
    { Methods & Properties }
    property Euro: Boolean read getEuro write setEuro;
    property Kurs: double read getKurs write setKurs;
    property Data: TDateTime read getData write setData;
    property NrTab: WideString read getNrTab write setNrTab;
  end;

{ IXMLTowaryType }

  IXMLTowaryType = interface(IXMLNodeCollection)
    ['{55C00165-24DD-4327-AE48-1B349AFEA9C7}']
    { Property Accessors }
    function getTowar(Index: Integer): IXMLTowarType;
    { Methods & Properties }
    function Add: IXMLTowarType;
    function Insert(const Index: Integer): IXMLTowarType;
    property Towar[Index: Integer]: IXMLTowarType read getTowar; default;
  end;

{ IXMLTowarType }

  IXMLTowarType = interface(IXMLNode)
    ['{03796D54-879A-464F-858C-5FDB4E38E84B}']
    { Property Accessors }
    function getNazwa: WideString;
    function getJm: WideString;
    function getPLN: Boolean;
    function getIlosc: double;
    function getCenaNSzt: double;
    function getRabat: Byte;
    function getWartNetto: double;
    function getVatProc: Byte;
    function getVatNd: Boolean;
    function getWartVAT: double;
    function getWartBrutto: double;
    procedure setNazwa(Value: WideString);
    procedure setJm(Value: WideString);
    procedure setPLN(Value: Boolean);
    procedure setIlosc(Value: double);
    procedure setCenaNSzt(Value: double);
    procedure setRabat(Value: Byte);
    procedure setWartNetto(Value: double);
    procedure setVatProc(Value: Byte);
    procedure setVatNd(Value: Boolean);
    procedure setWartVAT(Value: double);
    procedure setWartBrutto(Value: double);
    { Methods & Properties }
    property Nazwa: WideString read getNazwa write setNazwa;
    property Jm: WideString read getJm write setJm;
    property PLN: Boolean read getPLN write setPLN; 
    property Ilosc: double read getIlosc write setIlosc;
    property CenaNSzt: double read getCenaNSzt write setCenaNSzt;
    property Rabat: Byte read getRabat write setRabat;
    property WartNetto: double read getWartNetto write setWartNetto;
    property VatProc: Byte read getVatProc write setVatProc;
    property VatNd: Boolean read getVatNd write setVatNd;
    property WartVAT: double read getWartVAT write setWartVAT;
    property WartBrutto: double read getWartBrutto write setWartBrutto;
  end;

{ IXMLKonfiguracjaType }

  IXMLKonfiguracjaType = interface(IXMLNode)
    ['{A98CB46C-D6E1-48DC-A7E5-903A1A30F519}']
    { Property Accessors }
    function getDrukarka: byte;
    function getPodglad: byte;
    function getCzcionka: WideString;
    function getKurs: IXMLKursType;
    function getMsc: WideString;
    function getTypF: WideString;
    function getNrF: WideString;
    function getTypD: byte;
    function getTrans: WideString;
    function getSZap: WideString;
    procedure setDrukarka(Value: byte);
    procedure setPodglad(Value: byte);
    procedure setCzcionka(Value: WideString);
    procedure setMsc(Value: WideString);
    procedure setTypF(Value: WideString);
    procedure setNrF(Value: WideString);
    procedure setTypD(Value: byte);
    procedure setTrans(Value: WideString);
    procedure setSZap(Value: WideString);
    { Methods & Properties }
    property Drukarka: byte read getDrukarka write setDrukarka;
    property Podglad: byte read getPodglad write setPodglad;
    property Czcionka: WideString read getCzcionka write setCzcionka;
    property Kurs: IXMLKursType read getKurs;
    property Msc: WideString read getMsc write setMsc;
    property TypF: WideString read getTypF write setTypF;
    property NrF: WideString read getNrF write setNrF;
    property TypD: byte read getTypD write setTypD;
    property Trans: WideString read getTrans write setTrans;
    property SZap: WideString read getSZap write setSZap;
  end;

{ Forward Decls }

  TXMLAplikacjaType = class;
  TXMLKlienciType = class;
  TXMLKlientType = class;
  TXMLSprzedawcyType = class;
  TXMLSprzedawcaType = class;
  TXMLFakturyType = class;
  TXMLFakturaType = class;
  TXMLKursType = class;
  TXMLTowaryType = class;
  TXMLTowarType = class;
  TXMLKonfiguracjaType = class;

{ TXMLAplikacjaType }

  TXMLAplikacjaType = class(TXMLNode, IXMLAplikacjaType)
  protected
    { IXMLAplikacjaType }
    function getKlienci: IXMLKlienciType;
    function getSprzedawcy: IXMLSprzedawcyType;
    function getFaktury: IXMLFakturyType;
    function getKonfiguracja: IXMLKonfiguracjaType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLKlienciType }

  TXMLKlienciType = class(TXMLNodeCollection, IXMLKlienciType)
  protected
    { IXMLKlienciType }
    function getKlient(Index: Integer): IXMLKlientType;
    function Add: IXMLKlientType;
    function Insert(const Index: Integer): IXMLKlientType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLKlientType }

  TXMLKlientType = class(TXMLNode, IXMLKlientType)
  protected
    { IXMLKlientType }
    function getIdentyf: WideString;
    function getNazwa1: WideString;
    function getNazwa2: WideString;
    function getNIP: WideString;
    function getKod: WideString;
    function getMiasto: WideString;
    function getUlica: WideString;
    function getNrDomu: WideString;
    function getWojew: Byte;
    function getOddzial: WideString;
    function getNBanku1: WideString;
    function getNrKonta1: WideString;
    function getNBanku2: WideString;
    function getNrKonta2: WideString;
    function getUwagi: WideString;
    function isDeleted: Boolean;
    procedure setIdentyf(Value: WideString);
    procedure setNazwa1(Value: WideString);
    procedure setNazwa2(Value: WideString);
    procedure setNIP(Value: WideString);
    procedure setKod(Value: WideString);
    procedure setMiasto(Value: WideString);
    procedure setUlica(Value: WideString);
    procedure setNrDomu(Value: WideString);
    procedure setWojew(Value: Byte);
    procedure setOddzial(Value: WideString);
    procedure setNBanku1(Value: WideString);
    procedure setNrKonta1(Value: WideString);
    procedure setNBanku2(Value: WideString);
    procedure setNrKonta2(Value: WideString);
    procedure setUwagi(Value: WideString);
    procedure setDeleted(Value: Boolean);
  end;

{ TXMLSprzedawcyType }

  TXMLSprzedawcyType = class(TXMLNodeCollection, IXMLSprzedawcyType)
  protected
    { IXMLSprzedawcyType }
    function getSprzedawca(Index: Integer): IXMLSprzedawcaType;
    function Add: IXMLSprzedawcaType;
    function Insert(const Index: Integer): IXMLSprzedawcaType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSprzedawcaType }

  TXMLSprzedawcaType = class(TXMLNode, IXMLSprzedawcaType)
  protected
    { IXMLSprzedawcaType }
    function getIdentyf: WideString;
    function getNazwa1: WideString;
    function getNazwa2: WideString;
    function getNIP: WideString;
    function getKod: WideString;
    function getMiasto: WideString;
    function getUlica: WideString;
    function getNrDomu: WideString;
    function getWojew: Byte;
    function getOddzial: WideString;
    function getNBanku1: WideString;
    function getNrKonta1: WideString;
    function getNBanku2: WideString;
    function getNrKonta2: WideString;
    function getUwagi: WideString;   
    function isDeleted: Boolean;
    procedure setIdentyf(Value: WideString);
    procedure setNazwa1(Value: WideString);
    procedure setNazwa2(Value: WideString);
    procedure setNIP(Value: WideString);
    procedure setKod(Value: WideString);
    procedure setMiasto(Value: WideString);
    procedure setUlica(Value: WideString);
    procedure setNrDomu(Value: WideString);
    procedure setWojew(Value: Byte);
    procedure setOddzial(Value: WideString);
    procedure setNBanku1(Value: WideString);
    procedure setNrKonta1(Value: WideString);
    procedure setNBanku2(Value: WideString);
    procedure setNrKonta2(Value: WideString);
    procedure setUwagi(Value: WideString);
    procedure setDeleted(Value: Boolean);
  end;

{ TXMLFakturyType }

  TXMLFakturyType = class(TXMLNodeCollection, IXMLFakturyType)
  protected
    { IXMLFakturyType }
    function getFaktura(Index: Integer): IXMLFakturaType;
    function Add: IXMLFakturaType;
    function Insert(const Index: Integer): IXMLFakturaType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFakturaType }

  TXMLFakturaType = class(TXMLNode, IXMLFakturaType)
  protected
    { IXMLFakturaType }
    function getKlient: IXMLKlientType;
    function getSprzedawca: IXMLSprzedawcaType;
    function getMiejsc: WideString;
    function getDataDok: TDateTime;
    function getTypFak: WideString;
    function getNrFak: WideString;
    function getTypDok: WideString;
    function getDataSprzed: TDateTime;
    function getSposZapl: WideString;
    function getTermPlat: TDateTime;
    function getTransport: WideString;
    function getUwagi: WideString;
    function getKurs: IXMLKursType;
    function getTowary: IXMLTowaryType;
    function isDeleted: Boolean;
    procedure setMiejsc(Value: WideString);
    procedure setDataDok(Value: TDateTime);
    procedure setTypFak(Value: WideString);
    procedure setNrFak(Value: WideString);
    procedure setTypDok(Value: WideString);
    procedure setDataSprzed(Value: TDateTime);
    procedure setSposZapl(Value: WideString);
    procedure setTermPlat(Value: TDateTime);
    procedure setTransport(Value: WideString);
    procedure setUwagi(Value: WideString);
    procedure setDeleted(Value: Boolean);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLKursType }

  TXMLKursType = class(TXMLNode, IXMLKursType)
  protected
    { IXMLKursType }
    function getEuro: Boolean;
    function getKurs: double;
    function getData: TDateTime;
    function getNrTab: WideString;
    procedure setEuro(Value: Boolean);
    procedure setKurs(Value: double);
    procedure setData(Value: TDateTime);
    procedure setNrTab(Value: WideString);
  end;

{ TXMLTowaryType }

  TXMLTowaryType = class(TXMLNodeCollection, IXMLTowaryType)
  protected
    { IXMLTowaryType }
    function getTowar(Index: Integer): IXMLTowarType;
    function Add: IXMLTowarType;
    function Insert(const Index: Integer): IXMLTowarType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTowarType }

  TXMLTowarType = class(TXMLNode, IXMLTowarType)
  protected
    { IXMLTowarType }
    function getNazwa: WideString;
    function getJm: WideString;
    function getPLN: Boolean;
    function getIlosc: double;
    function getCenaNSzt: double;
    function getRabat: Byte;
    function getWartNetto: double;
    function getVatProc: Byte;
    function getVatNd: Boolean;
    function getWartVAT: double;
    function getWartBrutto: double;
    procedure setNazwa(Value: WideString);
    procedure setJm(Value: WideString);
    procedure setPLN(Value: Boolean);
    procedure setIlosc(Value: double);
    procedure setCenaNSzt(Value: double);
    procedure setRabat(Value: Byte);
    procedure setWartNetto(Value: double);
    procedure setVatProc(Value: Byte);
    procedure setVatNd(Value: Boolean);
    procedure setWartVAT(Value: double);
    procedure setWartBrutto(Value: double);
  end;

{ TXMLKonfiguracjaType }

  TXMLKonfiguracjaType = class(TXMLNode, IXMLKonfiguracjaType)
  protected
    { IXMLKonfiguracjaType }
    function getDrukarka: byte;
    function getPodglad: byte;
    function getCzcionka: WideString;
    function getKurs: IXMLKursType;
    function getMsc: WideString;
    function getTypF: WideString;
    function getNrF: WideString;
    function getTypD: byte;
    function getTrans: WideString;
    function getSZap: WideString;
    procedure setDrukarka(Value: byte);
    procedure setPodglad(Value: byte);
    procedure setCzcionka(Value: WideString);
    procedure setMsc(Value: WideString);
    procedure setTypF(Value: WideString);
    procedure setNrF(Value: WideString);
    procedure setTypD(Value: byte);
    procedure setTrans(Value: WideString);
    procedure setSZap(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ Global Functions }

function GetAplikacja(Doc: IXMLDocument): IXMLAplikacjaType;
function LoadAplikacja(const FileName: WideString): IXMLAplikacjaType;
function NewAplikacja: IXMLAplikacjaType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetAplikacja(Doc: IXMLDocument): IXMLAplikacjaType;
begin
  Result := Doc.GetDocBinding('Aplikacja', TXMLAplikacjaType, TargetNamespace) as IXMLAplikacjaType;
end;

function LoadAplikacja(const FileName: WideString): IXMLAplikacjaType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Aplikacja', TXMLAplikacjaType, TargetNamespace) as IXMLAplikacjaType;
end;

function NewAplikacja: IXMLAplikacjaType;
begin
  Result := NewXMLDocument.GetDocBinding('Aplikacja', TXMLAplikacjaType, TargetNamespace) as IXMLAplikacjaType;
end;

{ TXMLAplikacjaType }

procedure TXMLAplikacjaType.AfterConstruction;
begin
  RegisterChildNode('Klienci', TXMLKlienciType);
  RegisterChildNode('Sprzedawcy', TXMLSprzedawcyType);
  RegisterChildNode('Faktury', TXMLFakturyType);
  RegisterChildNode('Konfiguracja', TXMLKonfiguracjaType);
  inherited;
end;

function TXMLAplikacjaType.getKlienci: IXMLKlienciType;
begin
  Result := ChildNodes['Klienci'] as IXMLKlienciType;
end;

function TXMLAplikacjaType.getSprzedawcy: IXMLSprzedawcyType;
begin
  Result := ChildNodes['Sprzedawcy'] as IXMLSprzedawcyType;
end;

function TXMLAplikacjaType.getFaktury: IXMLFakturyType;
begin
  Result := ChildNodes['Faktury'] as IXMLFakturyType;
end;

function TXMLAplikacjaType.getKonfiguracja: IXMLKonfiguracjaType;
begin
  Result := ChildNodes['Konfiguracja'] as IXMLKonfiguracjaType;
end;

{ TXMLKlienciType }

procedure TXMLKlienciType.AfterConstruction;
begin
  RegisterChildNode('Klient', TXMLKlientType);
  ItemTag := 'Klient';
  ItemInterface := IXMLKlientType;
  inherited;
end;

function TXMLKlienciType.getKlient(Index: Integer): IXMLKlientType;
begin
  Result := List[Index] as IXMLKlientType;
end;

function TXMLKlienciType.Add: IXMLKlientType;
begin
  Result := AddItem(-1) as IXMLKlientType;
end;

function TXMLKlienciType.Insert(const Index: Integer): IXMLKlientType;
begin
  Result := AddItem(Index) as IXMLKlientType;
end;

{ TXMLKlientType }

function TXMLKlientType.isDeleted: Boolean;
begin 
  try
    Result := ChildNodes['Deleted'].NodeValue;    
  except
    Result := False; 
  end;
end;

procedure TXMLKlientType.setDeleted(Value: Boolean);
begin
  ChildNodes['Deleted'].NodeValue := Value;
end;

function TXMLKlientType.getIdentyf: WideString;
begin
  Result := ChildNodes['Identyf'].Text;
end;

procedure TXMLKlientType.setIdentyf(Value: WideString);
begin
  ChildNodes['Identyf'].NodeValue := Value;
end;

function TXMLKlientType.getNazwa1: WideString;
begin
  Result := ChildNodes['Nazwa1'].Text;
end;

procedure TXMLKlientType.setNazwa1(Value: WideString);
begin
  ChildNodes['Nazwa1'].NodeValue := Value;
end;

function TXMLKlientType.getNazwa2: WideString;
begin
  Result := ChildNodes['Nazwa2'].Text;
end;

procedure TXMLKlientType.setNazwa2(Value: WideString);
begin
  ChildNodes['Nazwa2'].NodeValue := Value;
end;

function TXMLKlientType.getNIP: WideString;
begin
  Result := ChildNodes['NIP'].Text;
end;

procedure TXMLKlientType.setNIP(Value: WideString);
begin
  ChildNodes['NIP'].NodeValue := Value;
end;

function TXMLKlientType.getKod: WideString;
begin
  Result := ChildNodes['Kod'].Text;
end;

procedure TXMLKlientType.setKod(Value: WideString);
begin
  ChildNodes['Kod'].NodeValue := Value;
end;

function TXMLKlientType.getMiasto: WideString;
begin
  Result := ChildNodes['Miasto'].Text;
end;

procedure TXMLKlientType.setMiasto(Value: WideString);
begin
  ChildNodes['Miasto'].NodeValue := Value;
end;

function TXMLKlientType.getUlica: WideString;
begin
  Result := ChildNodes['Ulica'].Text;
end;

procedure TXMLKlientType.setUlica(Value: WideString);
begin
  ChildNodes['Ulica'].NodeValue := Value;
end;

function TXMLKlientType.getNrDomu: WideString;
begin
  Result := ChildNodes['NrDomu'].Text;
end;

procedure TXMLKlientType.setNrDomu(Value: WideString);
begin
  ChildNodes['NrDomu'].NodeValue := Value;
end;

function TXMLKlientType.getWojew: Byte;
begin
  try
    Result := ChildNodes['Wojew'].NodeValue;  
  except
    Result := 0;    
  end;
end;

procedure TXMLKlientType.setWojew(Value: Byte);
begin
  ChildNodes['Wojew'].NodeValue := Value;
end;

function TXMLKlientType.getOddzial: WideString;
begin
  Result := ChildNodes['Oddzial'].Text;
end;

procedure TXMLKlientType.setOddzial(Value: WideString);
begin
  ChildNodes['Oddzial'].NodeValue := Value;
end;

function TXMLKlientType.getNBanku1: WideString;
begin
  Result := ChildNodes['NBanku1'].Text;
end;

procedure TXMLKlientType.setNBanku1(Value: WideString);
begin
  ChildNodes['NBanku1'].NodeValue := Value;
end;

function TXMLKlientType.getNrKonta1: WideString;
begin
  Result := ChildNodes['NrKonta1'].Text;
end;

procedure TXMLKlientType.setNrKonta1(Value: WideString);
begin
  ChildNodes['NrKonta1'].NodeValue := Value;
end;

function TXMLKlientType.getNBanku2: WideString;
begin
  Result := ChildNodes['NBanku2'].Text;
end;

procedure TXMLKlientType.setNBanku2(Value: WideString);
begin
  ChildNodes['NBanku2'].NodeValue := Value;
end;

function TXMLKlientType.getNrKonta2: WideString;
begin
  Result := ChildNodes['NrKonta2'].Text;
end;

procedure TXMLKlientType.setNrKonta2(Value: WideString);
begin
  ChildNodes['NrKonta2'].NodeValue := Value;
end;

function TXMLKlientType.getUwagi: WideString;
begin
  Result := ChildNodes['Uwagi'].Text;
end;

procedure TXMLKlientType.setUwagi(Value: WideString);
begin
  ChildNodes['Uwagi'].NodeValue := Value;
end;

{ TXMLSprzedawcyType }

procedure TXMLSprzedawcyType.AfterConstruction;
begin
  RegisterChildNode('Sprzedawca', TXMLSprzedawcaType);
  ItemTag := 'Sprzedawca';
  ItemInterface := IXMLSprzedawcaType;
  inherited;
end;

function TXMLSprzedawcyType.getSprzedawca(Index: Integer): IXMLSprzedawcaType;
begin
  Result := List[Index] as IXMLSprzedawcaType;
end;

function TXMLSprzedawcyType.Add: IXMLSprzedawcaType;
begin
  Result := AddItem(-1) as IXMLSprzedawcaType;
end;

function TXMLSprzedawcyType.Insert(const Index: Integer): IXMLSprzedawcaType;
begin
  Result := AddItem(Index) as IXMLSprzedawcaType;
end;

{ TXMLSprzedawcaType }

function TXMLSprzedawcaType.isDeleted: Boolean;
begin 
  try
    Result := ChildNodes['Deleted'].NodeValue;  
  except
    Result := False;    
  end;
end;

procedure TXMLSprzedawcaType.setDeleted(Value: Boolean);
begin
  ChildNodes['Deleted'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getIdentyf: WideString;
begin
  Result := ChildNodes['Identyf'].Text;
end;

procedure TXMLSprzedawcaType.setIdentyf(Value: WideString);
begin
  ChildNodes['Identyf'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getNazwa1: WideString;
begin
  Result := ChildNodes['Nazwa1'].Text;
end;

procedure TXMLSprzedawcaType.setNazwa1(Value: WideString);
begin
  ChildNodes['Nazwa1'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getNazwa2: WideString;
begin
  Result := ChildNodes['Nazwa2'].Text;
end;

procedure TXMLSprzedawcaType.setNazwa2(Value: WideString);
begin
  ChildNodes['Nazwa2'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getNIP: WideString;
begin
  Result := ChildNodes['NIP'].Text;
end;

procedure TXMLSprzedawcaType.setNIP(Value: WideString);
begin
  ChildNodes['NIP'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getKod: WideString;
begin
  Result := ChildNodes['Kod'].Text;
end;

procedure TXMLSprzedawcaType.setKod(Value: WideString);
begin
  ChildNodes['Kod'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getMiasto: WideString;
begin
  Result := ChildNodes['Miasto'].Text;
end;

procedure TXMLSprzedawcaType.setMiasto(Value: WideString);
begin
  ChildNodes['Miasto'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getUlica: WideString;
begin
  Result := ChildNodes['Ulica'].Text;
end;

procedure TXMLSprzedawcaType.setUlica(Value: WideString);
begin
  ChildNodes['Ulica'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getNrDomu: WideString;
begin
  Result := ChildNodes['NrDomu'].Text;
end;

procedure TXMLSprzedawcaType.setNrDomu(Value: WideString);
begin
  ChildNodes['NrDomu'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getWojew: Byte;
begin
  try
    Result := ChildNodes['Wojew'].NodeValue;  
  except
    Result := 0;    
  end;
end;

procedure TXMLSprzedawcaType.setWojew(Value: Byte);
begin
  ChildNodes['Wojew'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getOddzial: WideString;
begin
  Result := ChildNodes['Oddzial'].Text;
end;

procedure TXMLSprzedawcaType.setOddzial(Value: WideString);
begin
  ChildNodes['Oddzial'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getNBanku1: WideString;
begin
  Result := ChildNodes['NBanku1'].Text;
end;

procedure TXMLSprzedawcaType.setNBanku1(Value: WideString);
begin
  ChildNodes['NBanku1'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getNrKonta1: WideString;
begin
  Result := ChildNodes['NrKonta1'].Text;
end;

procedure TXMLSprzedawcaType.setNrKonta1(Value: WideString);
begin
  ChildNodes['NrKonta1'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getNBanku2: WideString;
begin
  Result := ChildNodes['NBanku2'].Text;
end;

procedure TXMLSprzedawcaType.setNBanku2(Value: WideString);
begin
  ChildNodes['NBanku2'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getNrKonta2: WideString;
begin
  Result := ChildNodes['NrKonta2'].Text;
end;

procedure TXMLSprzedawcaType.setNrKonta2(Value: WideString);
begin
  ChildNodes['NrKonta2'].NodeValue := Value;
end;

function TXMLSprzedawcaType.getUwagi: WideString;
begin
  Result := ChildNodes['Uwagi'].Text;
end;

procedure TXMLSprzedawcaType.setUwagi(Value: WideString);
begin
  ChildNodes['Uwagi'].NodeValue := Value;
end;

{ TXMLFakturyType }

procedure TXMLFakturyType.AfterConstruction;
begin
  RegisterChildNode('Faktura', TXMLFakturaType);
  ItemTag := 'Faktura';
  ItemInterface := IXMLFakturaType;
  inherited;
end;

function TXMLFakturyType.getFaktura(Index: Integer): IXMLFakturaType;
begin
  Result := List[Index] as IXMLFakturaType;
end;

function TXMLFakturyType.Add: IXMLFakturaType;
begin
  Result := AddItem(-1) as IXMLFakturaType;
end;

function TXMLFakturyType.Insert(const Index: Integer): IXMLFakturaType;
begin
  Result := AddItem(Index) as IXMLFakturaType;
end;

{ TXMLFakturaType }

procedure TXMLFakturaType.AfterConstruction;
begin
  RegisterChildNode('Klient', TXMLKlientType);
  RegisterChildNode('Sprzedawca', TXMLSprzedawcaType);
  RegisterChildNode('Kurs', TXMLKursType);
  RegisterChildNode('Towary', TXMLTowaryType);
  inherited;
end;  

function TXMLFakturaType.isDeleted: Boolean;
begin  
  try
    Result := ChildNodes['Deleted'].NodeValue;  
  except
    Result := False;    
  end;
end;

procedure TXMLFakturaType.setDeleted(Value: Boolean);
begin
  ChildNodes['Deleted'].NodeValue := Value;
end;

function TXMLFakturaType.getKlient: IXMLKlientType;
begin
  Result := ChildNodes['Klient'] as IXMLKlientType;
end;

function TXMLFakturaType.getSprzedawca: IXMLSprzedawcaType;
begin
  Result := ChildNodes['Sprzedawca'] as IXMLSprzedawcaType;
end;

function TXMLFakturaType.getMiejsc: WideString;
begin
  Result := ChildNodes['Miejsc'].Text;
end;

procedure TXMLFakturaType.setMiejsc(Value: WideString);
begin
  ChildNodes['Miejsc'].NodeValue := Value;
end;

function TXMLFakturaType.getDataDok: TDateTime;
begin
  Result := VarToDateTime(ChildNodes['DataDok'].NodeValue);
end;

procedure TXMLFakturaType.setDataDok(Value: TDateTime);
begin
  ChildNodes['DataDok'].NodeValue := Value;
end;

function TXMLFakturaType.getTypFak: WideString;
begin
  Result := ChildNodes['TypFak'].Text;
end;

procedure TXMLFakturaType.setTypFak(Value: WideString);
begin
  ChildNodes['TypFak'].NodeValue := Value;
end;

function TXMLFakturaType.getNrFak: WideString;
begin
  Result := ChildNodes['NrFak'].Text;
end;

procedure TXMLFakturaType.setNrFak(Value: WideString);
begin
  ChildNodes['NrFak'].NodeValue := Value;
end;

function TXMLFakturaType.getTypDok: WideString;
begin
  Result := ChildNodes['TypDok'].Text;
end;

procedure TXMLFakturaType.setTypDok(Value: WideString);
begin
  ChildNodes['TypDok'].NodeValue := Value;
end;

function TXMLFakturaType.getDataSprzed: TDateTime;
begin
  Result := VarToDateTime(ChildNodes['DataSprzed'].NodeValue);
end;

procedure TXMLFakturaType.setDataSprzed(Value: TDateTime);
begin
  ChildNodes['DataSprzed'].NodeValue := Value;
end;

function TXMLFakturaType.getSposZapl: WideString;
begin
  Result := ChildNodes['SposZapl'].Text;
end;

procedure TXMLFakturaType.setSposZapl(Value: WideString);
begin
  ChildNodes['SposZapl'].NodeValue := Value;
end;

function TXMLFakturaType.getTermPlat: TDateTime;
begin
  Result := VarToDateTime(ChildNodes['TermPlat'].NodeValue);
end;

procedure TXMLFakturaType.setTermPlat(Value: TDateTime);
begin
  ChildNodes['TermPlat'].NodeValue := Value;
end;

function TXMLFakturaType.getTransport: WideString;
begin
  Result := ChildNodes['Transport'].Text;
end;

procedure TXMLFakturaType.setTransport(Value: WideString);
begin
  ChildNodes['Transport'].NodeValue := Value;
end;

function TXMLFakturaType.getUwagi: WideString;
begin
  Result := ChildNodes['Uwagi'].Text;
end;

procedure TXMLFakturaType.setUwagi(Value: WideString);
begin
  ChildNodes['Uwagi'].NodeValue := Value;
end;

function TXMLFakturaType.getKurs: IXMLKursType;
begin
  Result := ChildNodes['Kurs'] as IXMLKursType;
end;

function TXMLFakturaType.getTowary: IXMLTowaryType;
begin
  Result := ChildNodes['Towary'] as IXMLTowaryType;
end;

{ TXMLKursType }

function TXMLKursType.getEuro: Boolean;
begin
  Result := ChildNodes['Euro'].NodeValue;
end;

procedure TXMLKursType.setEuro(Value: Boolean);
begin
  ChildNodes['Euro'].NodeValue := Value;
end;

function TXMLKursType.getKurs: double;
begin
  Result := ChildNodes['Kurs'].NodeValue;
end;

procedure TXMLKursType.setKurs(Value: double);
begin
  ChildNodes['Kurs'].NodeValue := Value;
end;

function TXMLKursType.getData: TDateTime;
begin
  Result := VarToDateTime(ChildNodes['Data'].NodeValue);
end;

procedure TXMLKursType.setData(Value: TDateTime);
begin
  ChildNodes['Data'].NodeValue := Value;
end;

function TXMLKursType.getNrTab: WideString;
begin
  Result := ChildNodes['NrTab'].Text;
end;

procedure TXMLKursType.setNrTab(Value: WideString);
begin
  ChildNodes['NrTab'].NodeValue := Value;
end;

{ TXMLTowaryType }

procedure TXMLTowaryType.AfterConstruction;
begin
  RegisterChildNode('Towar', TXMLTowarType);
  ItemTag := 'Towar';
  ItemInterface := IXMLTowarType;
  inherited;
end;

function TXMLTowaryType.getTowar(Index: Integer): IXMLTowarType;
begin
  Result := List[Index] as IXMLTowarType;
end;

function TXMLTowaryType.Add: IXMLTowarType;
begin
  Result := AddItem(-1) as IXMLTowarType;
end;

function TXMLTowaryType.Insert(const Index: Integer): IXMLTowarType;
begin
  Result := AddItem(Index) as IXMLTowarType;
end;

{ TXMLTowarType }

function TXMLTowarType.getNazwa: WideString;
begin
  Result := ChildNodes['Nazwa'].Text;
end;

procedure TXMLTowarType.setNazwa(Value: WideString);
begin
  ChildNodes['Nazwa'].NodeValue := Value;
end;

function TXMLTowarType.getJm: WideString;
begin
  Result := ChildNodes['Jm'].Text;
end;

procedure TXMLTowarType.setJm(Value: WideString);
begin
  ChildNodes['Jm'].NodeValue := Value;
end;

function TXMLTowarType.getPLN: Boolean;
begin
  Result := ChildNodes['PLN'].NodeValue;
end;

procedure TXMLTowarType.setPLN(Value: Boolean);
begin
  ChildNodes['PLN'].NodeValue := Value;
end;

function TXMLTowarType.getIlosc: double;
begin
  Result := ChildNodes['Ilosc'].NodeValue;
end;

procedure TXMLTowarType.setIlosc(Value: double);
begin
  ChildNodes['Ilosc'].NodeValue := Value;
end;

function TXMLTowarType.getCenaNSzt: double;
begin
  Result := ChildNodes['CenaNSzt'].NodeValue;
end;

procedure TXMLTowarType.setCenaNSzt(Value: double);
begin
  ChildNodes['CenaNSzt'].NodeValue := Value;
end;

function TXMLTowarType.getRabat: Byte;
begin
  Result := ChildNodes['Rabat'].NodeValue;
end;

procedure TXMLTowarType.setRabat(Value: Byte);
begin
  ChildNodes['Rabat'].NodeValue := Value;
end;

function TXMLTowarType.getWartNetto: double;
begin
  Result := ChildNodes['WartNetto'].NodeValue;
end;

procedure TXMLTowarType.setWartNetto(Value: double);
begin
  ChildNodes['WartNetto'].NodeValue := Value;
end;

function TXMLTowarType.getVatProc: Byte;
begin
  Result := ChildNodes['VatProc'].NodeValue;
end;

procedure TXMLTowarType.setVatProc(Value: Byte);
begin
  ChildNodes['VatProc'].NodeValue := Value;
end;

function TXMLTowarType.getVatNd: Boolean;
begin
  if not VarIsNull(ChildNodes['VatNd'].NodeValue) then
    Result := ChildNodes['VatNd'].NodeValue else
    Result := False;
end;

procedure TXMLTowarType.setVatNd(Value: Boolean);
begin
  ChildNodes['VatNd'].NodeValue := Value;
end;

function TXMLTowarType.getWartVAT: double;
begin
  Result := ChildNodes['WartVAT'].NodeValue;
end;

procedure TXMLTowarType.setWartVAT(Value: double);
begin
  ChildNodes['WartVAT'].NodeValue := Value;
end;

function TXMLTowarType.getWartBrutto: double;
begin
  Result := ChildNodes['WartBrutto'].NodeValue;
end;

procedure TXMLTowarType.setWartBrutto(Value: double);
begin
  ChildNodes['WartBrutto'].NodeValue := Value;
end;

{ TXMLKonfiguracjaType }

procedure TXMLKonfiguracjaType.AfterConstruction;
begin
  RegisterChildNode('Kurs', TXMLKursType);
  inherited;
end;

function TXMLKonfiguracjaType.getDrukarka: byte;
begin
  Result := ChildNodes['Drukarka'].NodeValue;
end;

procedure TXMLKonfiguracjaType.setDrukarka(Value: byte);
begin
  ChildNodes['Drukarka'].NodeValue := Value;
end;

function TXMLKonfiguracjaType.getPodglad: byte;
begin
  Result := ChildNodes['Podglad'].NodeValue;
end;

procedure TXMLKonfiguracjaType.setPodglad(Value: byte);
begin
  ChildNodes['Podglad'].NodeValue := Value;
end;

function TXMLKonfiguracjaType.getCzcionka: WideString;
begin
  Result := ChildNodes['Czcionka'].Text;
end;

procedure TXMLKonfiguracjaType.setCzcionka(Value: WideString);
begin
  ChildNodes['Czcionka'].NodeValue := Value;
end;

function TXMLKonfiguracjaType.getKurs: IXMLKursType;
begin
  Result := ChildNodes['Kurs'] as IXMLKursType;
end;

function TXMLKonfiguracjaType.getMsc: WideString;
begin
  Result := ChildNodes['Msc'].Text;
end;

procedure TXMLKonfiguracjaType.setMsc(Value: WideString);
begin
  ChildNodes['Msc'].NodeValue := Value;
end;

function TXMLKonfiguracjaType.getTypF: WideString;
begin
  Result := ChildNodes['TypF'].Text;
end;

procedure TXMLKonfiguracjaType.setTypF(Value: WideString);
begin
  ChildNodes['TypF'].NodeValue := Value;
end;

function TXMLKonfiguracjaType.getNrF: WideString;
begin
  Result := ChildNodes['NrF'].Text;
end;

procedure TXMLKonfiguracjaType.setNrF(Value: WideString);
begin
  ChildNodes['NrF'].NodeValue := Value;
end;

function TXMLKonfiguracjaType.getTypD: byte;
begin
  Result := ChildNodes['TypD'].NodeValue;
end;

procedure TXMLKonfiguracjaType.setTypD(Value: byte);
begin
  ChildNodes['TypD'].NodeValue := Value;
end;

function TXMLKonfiguracjaType.getTrans: WideString;
begin
  Result := ChildNodes['Trans'].Text;
end;

procedure TXMLKonfiguracjaType.setTrans(Value: WideString);
begin
  ChildNodes['Trans'].NodeValue := Value;
end;

function TXMLKonfiguracjaType.getSZap: WideString;
begin
  Result := ChildNodes['SZap'].Text;
end;

procedure TXMLKonfiguracjaType.setSZap(Value: WideString);
begin
  ChildNodes['SZap'].NodeValue := Value;
end;

{ TXMLKlientType2 }

{ TXMLSprzedawcaType2 }

{ TXMLFakturaType2 }

end.