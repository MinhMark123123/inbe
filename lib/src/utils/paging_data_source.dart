import 'package:inabe/src/data/dto/response/meta_data_list.dart';

mixin PagingDataSource<T> {
  List<T>? _dataList;
  Function()? _fetchFuncApi;
  Function()? _loadMoreFuncApi;
  MetaDataList? _medaData;
  bool _isFirstTimeFetch = true;
  bool _isLoadingMore = false;
  int pageSizeLimit = 20;

  bool get isFirstTimeFetch => _isFirstTimeFetch;

  int get currentPage => _medaData?.currentPage ?? 0;

  int get totalItems => _medaData?.totalCount ?? 0;

  int get totalPage => _medaData?.totalPages ?? 0;

  List<T> get dataList => _dataList ?? List<T>.empty();

  void setupFetchApi(Function() fetchApi) {
    _fetchFuncApi = fetchApi;
  }

  void setupLoadMoreApi(Function() loadMoreFuncApi) {
    _loadMoreFuncApi = loadMoreFuncApi;
  }

  Future<void> refresh() async {
    if (_fetchFuncApi == null) {
      return;
    }
    _fetchFuncApi!();
  }

  Future<void> Function()? get loadMore {
    print("ttt loadMore : ${dataList.length} ::: $totalItems");

    return dataList.length < totalItems ? () => _loadMore() : null;
  }

  Future<void> _loadMore() async {
    print("ttt _loadMore");
    if (_loadMoreFuncApi == null) {
      return;
    }
    final currentTotalItems = totalItems;
    final currentItems = _dataList?.length ?? 0;
    if (currentItems < currentTotalItems) {
      _isLoadingMore = true;
      _loadMoreFuncApi!();
    }
  }

  void updateDataRes(MetaDataList? meta, List<T>? data) {
    if(meta == null || data == null) {
      return;
    }
    _medaData = meta;
    _isFirstTimeFetch = false;
    if(_isLoadingMore) {
      _dataList?.addAll(data);
      _isLoadingMore = false;
      return;
    }
    _dataList = data;
  }
}
