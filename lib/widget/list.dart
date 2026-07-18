import 'package:to_do/app_exports.dart';


class ListWidget extends StatefulWidget {
  final List<TaskModule> tasks;
  final Function(bool?, int) ontap;

  const ListWidget({super.key, required this.ontap, required this.tasks});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 70),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
      itemCount: widget.tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: 72,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff282828),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: widget.tasks[index].isDone,
                  onChanged: (bool? value) {
                    widget.ontap(value, index);
                  },

                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.tasks[index].taskName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            decoration: widget.tasks[index].isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: widget.tasks[index].isDone
                                ? const Color(0xffA0A0A0)
                                : const Color(0xffFFFCFC),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.tasks[index].taskDescription,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xffC6C6C6),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}