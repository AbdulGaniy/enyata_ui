import 'package:flutter/material.dart';
import 'package:ui_package/configs/_config.dart';

import 'gap.dart';


class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.screenHeight * 1,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 12.5,
                          width: 55,
                          decoration: BoxDecoration(
                            color: context.customColorScheme.loaderColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const Gap(4),
                        Container(
                          height: 8.75,
                          width: 30,
                          decoration: BoxDecoration(
                              color: context.customColorScheme.loaderColor,
                              borderRadius: BorderRadius.circular(18)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 8.75,
                      width: 30,
                      decoration: BoxDecoration(
                          color: context.customColorScheme.loaderColor,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 5,
                    ),
                  ],
                ),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 10.5,
                  width: 227,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 10.5,
                  width: 200,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 10.5,
                  width: 306,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(5),
              Container(
                width: double.infinity,
                height: 200,
                color: context.colorScheme.primary.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 30,
                    ),
                    const Gap(16),
                    Container(
                      width: 170,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: context.colorScheme.primary),
                      child: Center(
                        child: Container(
                          width: 123,
                          height: 13,
                          color: context.customColorScheme.loaderColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: context.customColorScheme.loaderColor,
                    radius: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: context.customColorScheme.loaderColor,
                    radius: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: context.customColorScheme.loaderColor,
                    radius: 5,
                  ),
                ],
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 10,
                    ),
                    const Gap(2),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 5,
                    ),
                    const Gap(10),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 10,
                    ),
                    const Gap(2),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 5,
                    ),
                    const Gap(10),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 10,
                    ),
                    const Gap(2),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 5,
                    ),
                  ],
                ),
              ),
              const Gap(44),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 12.5,
                          width: 55,
                          decoration: BoxDecoration(
                            color: context.customColorScheme.loaderColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const Gap(4),
                        Container(
                          height: 8.75,
                          width: 30,
                          decoration: BoxDecoration(
                              color: context.customColorScheme.loaderColor,
                              borderRadius: BorderRadius.circular(18)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 8.75,
                      width: 30,
                      decoration: BoxDecoration(
                          color: context.customColorScheme.loaderColor,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 5,
                    ),
                  ],
                ),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 42),
                child: Container(
                  height: 10.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 60),
                child: Container(
                  height: 10.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 38),
                child: Container(
                  height: 10.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 60),
                child: Container(
                  height: 10.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 80),
                child: Container(
                  height: 10.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 42),
                child: Container(
                  height: 10.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 42),
                child: Container(
                  height: 10.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 60),
                child: Container(
                  height: 10.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 35),
                child: Container(
                  height: 10.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 10,
                    ),
                    const Gap(2),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 5,
                    ),
                    const Gap(20),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 10,
                    ),
                    const Gap(2),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 5,
                    ),
                    const Gap(10),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 10,
                    ),
                    const Gap(2),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 5,
                    ),
                  ],
                ),
              ),
              const Gap(44),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 12.5,
                          width: 55,
                          decoration: BoxDecoration(
                            color: context.customColorScheme.loaderColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const Gap(4),
                        Container(
                          height: 8.75,
                          width: 30,
                          decoration: BoxDecoration(
                              color: context.customColorScheme.loaderColor,
                              borderRadius: BorderRadius.circular(18)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 8.75,
                      width: 30,
                      decoration: BoxDecoration(
                          color: context.customColorScheme.loaderColor,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 5,
                    ),
                  ],
                ),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 10.5,
                  width: 227,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 10.5,
                  width: 200,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(4),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 10.5,
                  width: 306,
                  decoration: BoxDecoration(
                      color: context.customColorScheme.loaderColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
              const Gap(5),
              Container(
                width: double.infinity,
                height: 200,
                color: context.colorScheme.primary.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: context.customColorScheme.loaderColor,
                      radius: 30,
                    ),
                    const Gap(16),
                    Container(
                      width: 170,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: context.colorScheme.primary),
                      child: Center(
                        child: Container(
                          width: 123,
                          height: 13,
                          color: context.customColorScheme.loaderColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
