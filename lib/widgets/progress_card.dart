import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/todo_providers/todo_provider.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:notes_sphere_v116/providers/todo_providers/progress_provider.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int completedTask =
        Provider.of<TodoProvider>(context, listen: false).completedTasks.length;
    int totalTask =
        Provider.of<TodoProvider>(context, listen: false).tasks.length;

    final progressProvider =
        Provider.of<ProgressProvider>(context, listen: false);

    // Update progress value whenever `completedTask` or `totalTask` changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      progressProvider.updateProgress(completedTask, totalTask);
    });

    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's progress",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                kVerticalSpace10,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text.rich(
                    TextSpan(
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: "You have completed",
                        ),
                        TextSpan(
                          text: "\n $completedTask",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        TextSpan(
                          text: " out of ",
                        ),
                        TextSpan(
                          text: "$totalTask",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        TextSpan(
                          text: " tasks,\nkeep up the progress.",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Consumer<ProgressProvider>(
              builder: (context, progressProvider, child) {
                return SimpleCircularProgressBar(
                  valueNotifier: progressProvider.progressNotifier,
                  animationDuration: 1,
                  progressStrokeWidth: 10,
                  progressColors: [
                    Colors.purpleAccent, // 0% - Starting (Futuristic vibe)
                    Colors.blueAccent, // 25% - Progressing
                    Colors.cyanAccent, // 50% - Halfway done
                    Colors.tealAccent, // 75% - Almost complete
                    Colors.greenAccent, // 100% - Completed
                  ],
                  mergeMode: true,
                  onGetText: (double value) {
                    return Text(
                      '${value.toInt()}%',
                      style: Theme.of(context).textTheme.titleLarge,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
