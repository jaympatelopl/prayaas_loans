class ConsentHandleRequest
{
  String? loanApplicationRefId;
  String? aaCode;
  String? aaId;
  String? consentFetchType;

  ConsentHandleRequest({this.loanApplicationRefId,this.aaCode,this.aaId,this.consentFetchType});

  ConsentHandleRequest.fromJson(Map<String,dynamic> json)
  {
    loanApplicationRefId = json['loanApplicationRefId'];
    aaCode = json['aaCode'];
    aaId = json['aaId'];
    consentFetchType = json['consentFetchType'];
  }

  Map<String,dynamic> toJson() =>{
    'loanApplicationRefId':loanApplicationRefId,
    'aaCode':aaCode,
    'aaId':aaId,
    'consentFetchType':consentFetchType
  };
}