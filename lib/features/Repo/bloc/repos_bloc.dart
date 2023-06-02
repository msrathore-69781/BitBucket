import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'repos_event.dart';
part 'repos_state.dart';

class ReposBloc extends Bloc<ReposEvent, ReposState> {
  ReposBloc():super(ReposInitial()){
 on<getRepos>(gtRepos);
  }

 
  

  FutureOr<void> gtRepos(getRepos event, Emitter<ReposState> emit) {
    emit(NavigateToRepoPage());
  }
}
