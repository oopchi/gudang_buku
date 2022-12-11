import 'package:bookstore/config/constant/colors.dart';
import 'package:bookstore/config/constant/routes.dart';
import 'package:bookstore/data/repository/author_book_repository_fs.dart';
import 'package:bookstore/data/repository/author_repository_fs.dart';
import 'package:bookstore/data/repository/book_repository_fs.dart';
import 'package:bookstore/data/repository/media_repository_fs.dart';
import 'package:bookstore/presentation/pages/add_product/mobile/state.dart';
import 'package:bookstore/presentation/widget/appbar_helper.dart';
import 'package:bookstore/presentation/widget/button_helper.dart';
import 'package:bookstore/presentation/widget/dialog_helper.dart';
import 'package:bookstore/presentation/widget/form_input_helper.dart';
import 'package:bookstore/presentation/widget/loading_helper.dart';
import 'package:bookstore/presentation/widget/snackbar_helper.dart';
import 'package:bookstore/presentation/widget/spacing.dart';
import 'package:bookstore/util/text_helper.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list_interface.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'cubit.dart';

class AddProductMobilePage extends StatefulWidget {
  const AddProductMobilePage({super.key});

  @override
  State<AddProductMobilePage> createState() => _AddProductMobilePageState();
}

class _AddProductMobilePageState extends State<AddProductMobilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isMounted() => mounted;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddProductMobileCubit(
        bookRepository: BookRepositoryFS(),
        authorRepository: AuthorRepositoryFS(),
        authorBookRepository: AuthorBookRepositoryFS(),
        mediaRepository: MediaRepositoryFS(),
        isMounted: _isMounted,
      )..load(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<AddProductMobileCubit, AddProductMobileState>(
      buildWhen: (previous, current) =>
          current is! AddProductMobileSuccess &&
          current is! AddProductMobileFailure,
      listener: (context, state) {
        if (state is AddProductMobileSuccess) {
          context.goNamed(AppRoutes.home.name);
        }

        if (state is AddProductMobileFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(AppSnackBar(
              content: state.message,
            ));
        }
      },
      builder: (context, state) {
        if (state is AddProductMobileLoading) return const AppLoadingView();

        if (state is AddProductMobileFormState) {
          return Scaffold(
            appBar: _buildAppBar(context, state),
            body: _buildForm(context, state),
            bottomNavigationBar: _buildBottomNavBar(context, state),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildBottomNavBar(
      BuildContext context, AddProductMobileFormState state) {
    final cubit = BlocProvider.of<AddProductMobileCubit>(context);
    return Container(
      height: 104.0.h,
      padding: EdgeInsets.fromLTRB(
        16.0.w,
        20.0.h,
        16.0.w,
        48.0.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 8.0.sp,
            offset: Offset(
              .0,
              -4.0.sp,
            ),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: AppOutlineButton(
              onPressed: () {},
              text: 'Discard',
              padding: 8.0,
              textStyle: CustomTextStyles.medium.size(
                14.0,
              ),
            ),
          ),
          Spacing.horizontal(23.0.w),
          Expanded(
            child: AppButton(
              onPressed: () => cubit.addBook(state),
              text: 'Add Book',
              padding: 8.0,
              textStyle: CustomTextStyles.medium.size(
                14.0,
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
      BuildContext context, AddProductMobileFormState state) {
    return AppBarHelper(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.chevron_left),
              iconSize: 30.0.sp,
              padding: EdgeInsets.all(8.0.sp),
              constraints: const BoxConstraints(),
            ),
          ),
          Center(
            child: Text(
              'Add Book',
              style: CustomTextStyles.semiBold.size(18.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, AddProductMobileFormState state) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.w,
          vertical: 20.0.h,
        ),
        children: <Widget>[
          _buildImageAndVideoPrompt(context, state),
          _buildTitlePrompt(context, state),
          _buildOverviewPrompt(context, state),
          _buildAuthorsPrompt(context, state),
          _buildPricePrompt(context, state),
          _buildStockPrompt(context, state),
        ],
      ),
    );
  }

  Widget _buildImageAndVideoPrompt(
      BuildContext context, AddProductMobileFormState state) {
    final cubit = BlocProvider.of<AddProductMobileCubit>(context);
    return DragAndDropLists(
      axis: Axis.horizontal,
      listWidth: 275.0.sp,
      listDraggingWidth: 275.0.sp,
      listPadding: EdgeInsets.zero,
      disableScrolling: true,
      onItemReorder:
          (oldItemIndex, oldListIndex, newItemIndex, newListIndex) {},
      onListReorder: (oldListIndex, newListIndex) {
        cubit.changeLocImages(state, oldListIndex, newListIndex);
      },
      children: <DragAndDropListInterface>[
        for (int i = 0; i < state.images.length; i++)
          _buildImageHolder(context, state, i),
        if (state.images.isEmpty) _buildImageHolder(context, state, -1),
        _buildAddImageButton(context, state),
      ],
    );
  }

  DragAndDropListInterface _buildAddImageButton(
      BuildContext context, AddProductMobileFormState state) {
    final cubit = BlocProvider.of<AddProductMobileCubit>(context);
    return DragAndDropList(
      canDrag: false,
      children: <DragAndDropItem>[
        DragAndDropItem(
          canDrag: false,
          child: Container(
            color: AppColor.gray,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () => cubit.pickImages(state),
                  icon: const Icon(Icons.add_a_photo),
                  iconSize: 30.0.sp,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                IconButton(
                  onPressed: () => cubit.pickVideo(state),
                  icon: const Icon(Icons.video_call_rounded),
                  iconSize: 30.0.sp,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DragAndDropListInterface _buildImageHolder(
      BuildContext context, AddProductMobileFormState state, int index) {
    final cubit = BlocProvider.of<AddProductMobileCubit>(context);
    return DragAndDropList(
      contentsWhenEmpty: Container(
        color: AppColor.gray,
        child: GestureDetector(
          onTap: index == -1
              ? null
              : () async {
                  final bool? res = await showAppDialog<bool?>(
                    context: context,
                    child: const AppConfirmationDialog(
                      subTitle: 'Are you sure you want to delete this image?',
                    ),
                  );

                  if (res != null && res) {
                    cubit.deleteImage(state, index);
                  }
                },
          child: index == -1
              ? Center(
                  child: Icon(
                    Icons.image,
                    size: 40.0.sp,
                  ),
                )
              : Container(
                  width: 275.0.sp,
                  height: 413.0.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0.r),
                  ),
                  child: Image.memory(state.images[index]),
                ),
        ),
      ),
      children: <DragAndDropItem>[],
    );
  }

  Widget _buildTitlePrompt(
      BuildContext context, AddProductMobileFormState state) {
    final AddProductMobileCubit cubit =
        BlocProvider.of<AddProductMobileCubit>(context);
    return AppTextFormField(
      onChanged: (title) => cubit.checkTitle(state, title),
      validator: (String? value) =>
          value?.trim() != '' ? null : 'Invalid title',
      errorText: state.title.trim() == '' ? 'Invalid title' : null,
      hintText: 'Harry Potter',
      label: 'Judul Buku',
      suffixIcon: state.title.trim() == ''
          ? Icon(
              Icons.warning,
              size: 24.0.sp,
              color: AppColor.error,
            )
          : Icon(
              Icons.check,
              size: 24.0.sp,
              color: Colors.green,
            ),
    );
  }

  Widget _buildOverviewPrompt(
      BuildContext context, AddProductMobileFormState state) {
    final AddProductMobileCubit cubit =
        BlocProvider.of<AddProductMobileCubit>(context);
    return AppTextFormField(
      onChanged: (description) => cubit.checkDescription(state, description),
      label: 'Description',
    );
  }

  Widget _buildPricePrompt(
      BuildContext context, AddProductMobileFormState state) {
    final AddProductMobileCubit cubit =
        BlocProvider.of<AddProductMobileCubit>(context);
    return AppTextFormField(
      keyboardType: TextInputType.number,
      onChanged: (value) => cubit.checkPrice(state, int.tryParse(value) ?? -1),
      validator: (String? value) {
        if (value == null) return 'Value ';

        int realValue = int.tryParse(value) ?? -1;
        return;
      },
    );
  }

  Widget _buildStockPrompt(
      BuildContext context, AddProductMobileFormState state) {
    final AddProductMobileCubit cubit =
        BlocProvider.of<AddProductMobileCubit>(context);
    return AppTextFormField(
      onChanged: (title) => cubit.checkTitle(state, title),
      validator: (String? value) =>
          value?.trim() != '' ? null : 'Invalid title',
      errorText: state.title.trim() == '' ? 'Invalid title' : null,
      hintText: 'Harry Potter',
      label: 'Judul Buku',
      suffixIcon: state.title.trim() == ''
          ? Icon(
              Icons.warning,
              size: 24.0.sp,
              color: AppColor.error,
            )
          : Icon(
              Icons.check,
              size: 24.0.sp,
              color: Colors.green,
            ),
    );
  }
}
