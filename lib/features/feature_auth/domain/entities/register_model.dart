

class ReqisterModelUseCase{

  String? message;
  int? status;
  DataRegister? dataRegister;

  ReqisterModelUseCase(this.message, this.status, this.dataRegister);
}

class DataRegister{
  String? name;
  String? email;
  String? mobile;
  int? id;
  String? token;
  int? user_code_active;

  DataRegister(this.name, this.email, this.mobile, this.id, this.token,
      this.user_code_active);
}