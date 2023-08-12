mixin BaseRespository {
  bool _loading = false;

  bool get loading => _loading;

  void isLoading(bool isLoading) => _loading = !_loading;
}
