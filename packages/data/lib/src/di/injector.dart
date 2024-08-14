// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:data/src.dart';
import 'package:data/src/repositories/auth/auth_repo_impl.dart';
import 'package:data/src/repositories/booking/booking_repo_impl.dart';
import 'package:data/src/repositories/vehicles/vehicle_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class Injector {

   static Widget InjectReposWidget({required Widget child}){
     return MultiRepositoryProvider(
       providers: [
         RepositoryProvider<AuthRepo>(create: (ctx) => AuthRepoImpl()),
         RepositoryProvider<VehicleRepo>(create: (ctx) => VehicleRepoImpl()),
         RepositoryProvider<BookingRepo>(create: (ctx) => BookingRepoImpl()),
       ],
       child: child,
     );
   }

}