class ApiResponse<T> {
  Status status;

  T apiResponseData;

  String message;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.apiResponseData) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $apiResponseData";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
