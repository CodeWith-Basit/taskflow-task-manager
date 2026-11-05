import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/theme/app_colors.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedPriority = 'High';
  String selectedCategory = 'Work';

  @override
  Widget build(BuildContext context) {
    Future<void> pickDueDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2035),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primary,
                surface: AppColors.surface,
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    Future<void> pickDueTime() async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime ?? TimeOfDay.now(),
      );

      if (picked != null) {
        setState(() {
          selectedTime = picked;
        });
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 15, 16, 95),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Title",
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Enter task title...',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
                suffixIcon: const Icon(
                  Icons.edit_note,
                  color: AppColors.textSecondary,
                ),
                filled: true,
                fillColor: AppColors.surface,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Task Description",
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 4,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              keyboardType: TextInputType.multiline,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Enter task description here...',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
                suffixIcon: const Icon(
                  Icons.format_align_left_outlined,
                  color: AppColors.textSecondary,
                ),
                filled: true,
                fillColor: AppColors.surface,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Due Date",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DueDateButton(
                        dateText: selectedDate == null
                            ? 'Due Date'
                            : DateFormat('dd MMM yyyy').format(selectedDate!),
                        onTap: pickDueDate,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Due Time",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DueTimeButton(
                        timeText: selectedTime == null
                            ? 'Due Time'
                            : selectedTime!.format(context),
                        onTap: pickDueTime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            PrioritySelector(
              selectedPriority: selectedPriority,
              onChanged: (priority) {
                setState(() {
                  selectedPriority = priority;
                });
              },
            ),
            const SizedBox(height: 18),
            CategorySelector(
              selectedCategory: selectedCategory,
              onChanged: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
              onAddNew: () {},
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_task_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                label: Text(
                  "Create Task",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DueDateButton extends StatelessWidget {
  final VoidCallback onTap;
  final String dateText;

  const DueDateButton({super.key, required this.onTap, required this.dateText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Schedule",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    dateText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.calendar_month,
                  color: AppColors.primary,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DueTimeButton extends StatelessWidget {
  final VoidCallback onTap;
  final String timeText;

  const DueTimeButton({super.key, required this.onTap, required this.timeText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    timeText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.access_time,
                  color: AppColors.primary,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PrioritySelector extends StatelessWidget {
  final String selectedPriority;
  final ValueChanged<String> onChanged;

  const PrioritySelector({
    super.key,
    required this.selectedPriority,
    required this.onChanged,
  });

  Color _priorityColor(String priority) {
    switch (priority) {
      case 'Low':
        return const Color(0xFF10B981);
      case 'Medium':
        return const Color(0xFFF59E0B);
      case 'High':
      default:
        return const Color(0xFFB91C1C);
    }
  }

  @override
  Widget build(BuildContext context) {
    final priorities = ['Low', 'Medium', 'High'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "PRIORITY LEVEL",
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              "Determines task sort",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF0FA),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: priorities.map((priority) {
              final isSelected = selectedPriority == priority;
              final activeColor = _priorityColor(priority);

              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(priority),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    decoration: BoxDecoration(
                      color: isSelected ? activeColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white : activeColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          priority,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF344054),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class CategorySelector extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onChanged;
  final VoidCallback? onAddNew;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
    this.onAddNew,
  });

  static const List<Map<String, dynamic>> _categories = [
    {'label': 'Work', 'icon': Icons.work_outline},
    {'label': 'Personal', 'icon': Icons.person_outline},
    {'label': 'Study', 'icon': Icons.school_outlined},
    {'label': 'Health', 'icon': Icons.favorite_border},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CATEGORY",
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ..._categories.map((cat) {
              final String label = cat['label'] as String;
              final IconData icon = cat['icon'] as IconData;
              final bool isSelected = selectedCategory == label;

              return GestureDetector(
                onTap: () => onChanged(label),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryDark
                        : const Color(0xFFEEF0FA),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        size: 18,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF344054),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        label,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF344054),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
