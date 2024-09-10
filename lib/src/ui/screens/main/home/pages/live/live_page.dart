// Developed By Muhammad Waleed.. Senior Android and Flutter developer..
// waleedkalyar48@gmail.com/

import 'package:carlet_flutter/src/app/views/carlert_app.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_marker_bottom_sheet.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/bloc/live_markers_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/widgets/live_map_cluster_view.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/widgets/live_map_view.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/widgets/marker_view.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:data/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LiveMarkersBloc>().add(const InitPusherEvent(
          userToken:
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YzMyZDMzOC0yM2I2LTRlOWYtYWMyZS1hZGQzYjY4MWE3NzciLCJqdGkiOiI1ZDJmNzY4MDlhMDA4MjhiZTUyNDNiOTE5OTRlOWY2N2UzNGExMzU0YTg1MmNkYWNhZjJlNGE4MWVhNWIwZmU4MGViYjVlYjNhMzg4NjhiZSIsImlhdCI6MTcyNTQ1MzEzNy4wNDY4MTMsIm5iZiI6MTcyNTQ1MzEzNy4wNDY4MTYsImV4cCI6MTc1Njk4OTEzNy4wMzIzOCwic3ViIjoiMiIsInNjb3BlcyI6W119.J0qi4cXhDPBoMt1_TYFIV69cp7IhUk9lPQiovjTZ0-zL-Q4O0xvyKQL9sIzLSUiUksCPV2s23rd7qVSmmPPiJwiy0o5adHMAFtFiuPO20HaM27w7H7rq5dkr2ms5USteC8YvKQzk9x0SEXrwOA2ww8yYb7S0CezGsEogKxQssYnGzvB1PldSFOYW3YFHpRdjBRn5tXq0_KqNVluomJKDHFNY4e8BuHboEjubEN2l_tg90BJPjMsLGP8BEqlxzNLVygSwlZFX7bil66pER7rMgJNa1WSrcQFnlu5y4gN_WgVZQP5w-L2yugPHkoCMR6Pkqdjekf5hwMHd6xpG_cKwkQLdci0MFWjgZNXrxAiTi1EJtSPj7BxAk57Zed9tW6ioMT4pLLh6K_z4LRFBDXlGTFuMUmLSJIh7jusiI3BEgXpGUtRZgA1mw3EmmGLVJIOY2MfKocl0UxyCbkfRKBQ5-3MyegAj29fiDRBfGhgvgqgsw4684sV2_WFwMX3t3XlbXC4cNEMLY4tb8Tk5XwcG_Nc3Yi-xwmtn8urRYDKx85-t5n1BwUHntMdxr2pfoqHXNGk_IS2bLueJoaPDKFpXOm1-fvdqxYIBMYPrrrOlcrUFxI-AmeE8GWUF6MxsioNijZnG_gdPRsgqm0pm8ImQJHDBiojPjIcnx-v_q5TWSn4",
        ));

    return Scaffold(
        backgroundColor: appGrayBackground,
        body: BlocListener<LiveMarkersBloc, LiveMarkersState>(
          listener: (ctx, state) {
            if (state is PusherConnectionState) {
              if (state.state.toLowerCase() == "connected") {
                // context
                //     .read<LiveMarkersBloc>()
                //     .add(const SubscribeToVehiclesEvent("all-veh-location"));
              }
            }
          },
          child: Padding(padding: 0.allPadding, child:   const LiveMapView()),
        ));
  }
}
