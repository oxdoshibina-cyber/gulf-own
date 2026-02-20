part of 'items_collected_bloc.dart';


sealed class ItemsCollectedEvent extends Equatable{
  const ItemsCollectedEvent();

  @override
  List<Object?> get props => [];

}

class GetItemsCollectedEvent extends ItemsCollectedEvent{
  const GetItemsCollectedEvent();

  @override
  List<Object?> get props => [];
}

class InsertItemsCollectedEvent extends ItemsCollectedEvent{
  final InsertItemsCollectedReqModel insertItemsCollectedReqModel;

  const InsertItemsCollectedEvent({
    required this.insertItemsCollectedReqModel
  });

  @override
  List<Object?> get props => [insertItemsCollectedReqModel];
}

class UpdateItemsCollectedEvent extends ItemsCollectedEvent{
  final InsertItemsCollectedReqModel updateItemsCollectedReqModel;
  const UpdateItemsCollectedEvent({
    required this.updateItemsCollectedReqModel
  });

  @override
  List<Object?> get props => [updateItemsCollectedReqModel];
}

class GetItemsCollectedByIdEvent extends ItemsCollectedEvent {
  final int id;

  const GetItemsCollectedByIdEvent({
    required this.id
  });

  @override
  List<Object?> get props => [id];
}

class ClearItemsCollectedFlag extends ItemsCollectedEvent{
  const ClearItemsCollectedFlag();

  @override
  List<Object?> get props => [];
}

class DeleteItemsCollectedEvent extends ItemsCollectedEvent{
  final int id;

  const DeleteItemsCollectedEvent({
    required this.id
  });

  @override
  List<Object?> get props => [id];
}


