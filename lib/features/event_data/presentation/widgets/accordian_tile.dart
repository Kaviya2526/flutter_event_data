import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';


class CustomAccordionTile extends StatefulWidget {
  final String title;
  final Widget content;

  const CustomAccordionTile({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<CustomAccordionTile> createState() => _CustomAccordionTileState();
}

class _CustomAccordionTileState extends State<CustomAccordionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: AppColors.borderColor.withOpacity(0.33),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.17),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          backgroundColor: AppColors.lightPink.withOpacity(0.24),
          trailing: const SizedBox.shrink(),
          onExpansionChanged: (value) {
            setState(() {
              _expanded = value;
            });
          },
          tilePadding: EdgeInsets.zero,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                _expanded
                    ? const Icon(Icons.remove, color: Colors.purple)
                    : const Icon(Icons.add, color: Colors.purple),
                const SizedBox(width: 8),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(7)),
              ),
              child: widget.content,
            ),
          ],
        ),
      ),
    );
  }
}
