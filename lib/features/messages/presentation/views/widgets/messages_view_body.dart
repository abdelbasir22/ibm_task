// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ibm_task/features/messages/presentation/views/widgets/custom_messages_list_view.dart';
// import 'package:ibm_task/features/messages/presentation/views/widgets/expansion_tile_widget.dart';

// import '../../manger/messages_cubit/messages_cubit.dart';

// class MessagesViewBody extends StatelessWidget {
//   const MessagesViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MessagesCubit()..fetchMessages(),
//       child: BlocBuilder<MessagesCubit, MessagesState>(
//         builder: (context, state) {
//           if (state is MessagesLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is MessagesFaluier) {
//             return Center(child: Text(state.error));
//           } else if (state is MessagesLoaded) {
//             return const CustomScrollView(
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Sponsored",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w600)),
//                           ExpansionTileWidget(),
//                           SizedBox(height: 20),
//                           Text('More Conversations',
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w600)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 CustomMessagesListView(),
//               ],
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ibm_task/features/messages/presentation/views/widgets/custom_messages_list_view.dart';
import 'package:ibm_task/features/messages/presentation/views/widgets/expansion_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/messages_cubit/messages_cubit.dart';

class MessagesViewBody extends StatelessWidget {
  const MessagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final messagesCubit = BlocProvider.of<MessagesCubit>(context);
    messagesCubit.fetchMessages();

    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sponsored",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  ExpansionTileWidget(),
                  SizedBox(height: 20),
                  Text(
                    'More Conversations',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
        CustomMessagesListView(),
      ],
    );
  }
}
