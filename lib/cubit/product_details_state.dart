
import 'package:flutter/foundation.dart';

import '../models/product_details_model.dart';

@immutable
abstract class ProductDetailsState {}

class  ProductDetailsInitial extends ProductDetailsState{} 
class  ProductDetailsLoading extends ProductDetailsState {} 
class  ProductDetailsLoaded extends ProductDetailsState {
   ProductDetailsModel? postDetails;
   ProductDetailsLoaded(this.postDetails);
} 
class  ProductDetailsFailed extends ProductDetailsState {} 
