import 'package:aztira/src/models/todoModel0.dart';
import 'package:aztira/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc {
  final _repository = Repository();
  final _todoFetcher = PublishSubject<List<Todo>>();

  Observable<List<Todo>> get allTodo => _todoFetcher.stream;
  fetchAllTodo() async {
    List<Todo> todo = await _repository.fetchAllTodo();
    _todoFetcher.sink.add(todo);
  }

  dispose() {
    _todoFetcher.close();
  }
}

final bloc = TodoBloc();
