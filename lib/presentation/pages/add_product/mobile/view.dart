import 'package:gudang_buku/config/constant/colors.dart';
import 'package:gudang_buku/config/constant/routes.dart';
import 'package:gudang_buku/inter/repository/author_book_repository_fs.dart';
import 'package:gudang_buku/inter/repository/author_repository_fs.dart';
import 'package:gudang_buku/inter/repository/book_repository_fs.dart';
import 'package:gudang_buku/inter/repository/media_repository_fs.dart';
import 'package:gudang_buku/domain/model/author_model.dart';
import 'package:gudang_buku/presentation/pages/add_product/mobile/state.dart';
import 'package:gudang_buku/presentation/widget/appbar_helper.dart';
import 'package:gudang_buku/presentation/widget/button_helper.dart';
import 'package:gudang_buku/presentation/widget/dialog_helper.dart';
import 'package:gudang_buku/presentation/widget/form_input_helper.dart';
import 'package:gudang_buku/presentation/widget/loading_helper.dart';
import 'package:gudang_buku/presentation/widget/snackbar_helper.dart';
import 'package:gudang_buku/presentation/widget/spacing.dart';
import 'package:gudang_buku/util/form_helper.dart';
import 'package:gudang_buku/util/text_helper.dart';
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
  final TextEditingController _priceController = TextEditingController();

  bool _isMounted() => mounted;

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

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
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  cubit.addBook(state);
                }
              },
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
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.0.w,
          vertical: 20.0.h,
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 18.0.h,
            ),
            child: _buildImageAndVideoPrompt(context, state),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 18.0.h,
            ),
            child: _buildTitlePrompt(context, state),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 18.0.h,
            ),
            child: _buildOverviewPrompt(context, state),
          ),
          _buildAuthorsPrompts(context, state),
          Padding(
            padding: EdgeInsets.only(
              bottom: 18.0.h,
            ),
            child: _buildPricePrompt(context, state),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 18.0.h,
            ),
            child: _buildStockPrompt(context, state),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorsPrompts(
      BuildContext context, AddProductMobileFormState state) {
    return Column(
      children: <Widget>[
        for (int i = 0; i < state.selectedAuthors.length; i++)
          _buildAuthorsPrompt(context, state, i),
        _buildAuthorsPrompt(context, state, -1),
      ],
    );
  }

  Widget _buildAuthorsPrompt(
    BuildContext context,
    AddProductMobileFormState state,
    int index,
  ) {
    final AddProductMobileCubit cubit =
        BlocProvider.of<AddProductMobileCubit>(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: 18.0.h,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4.0.r),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 8.0.sp,
                    offset: Offset(
                      .0,
                      1.0.sp,
                    ),
                  ),
                ],
              ),
              child: DropdownButtonFormField<AuthorModel>(
                key: ValueKey(index),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: CustomTextStyles.regular.size(
                    11.0,
                    AppColor.error,
                  ),
                ),
                validator: (value) => state.selectedAuthors.isEmpty
                    ? 'There must at least be one author'
                    : null,
                dropdownColor: Colors.white,
                hint: Text(
                  'Author',
                  style: CustomTextStyles.regular.size(14.0, AppColor.gray),
                ),
                value: index == -1 ? null : state.selectedAuthors[index],
                borderRadius: BorderRadius.circular(8.0.r),
                isDense: true,
                focusColor: Colors.white,
                onChanged: (value) => cubit.selectAuthor(state, value!,
                    index == -1 ? state.selectedAuthors.length : index),
                items: state.authors
                    .where((element) =>
                        (index != -1 &&
                            element == state.selectedAuthors[index]) ||
                        !state.selectedAuthors.contains(element))
                    .map(
                  (
                    AuthorModel value,
                  ) {
                    return DropdownMenuItem<AuthorModel>(
                      value: value,
                      child: Text(
                        value.name,
                        style: CustomTextStyles.medium.size(14.0),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          if (index != -1)
            IconButton(
              onPressed: () => cubit.deleteSelectedAuthor(
                state,
                index,
              ),
              icon: const Icon(Icons.clear),
              iconSize: 30.0.sp,
              color: AppColor.error,
              padding: EdgeInsets.all(4.0.sp),
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }

  Widget _buildImageAndVideoPrompt(
      BuildContext context, AddProductMobileFormState state) {
    final cubit = BlocProvider.of<AddProductMobileCubit>(context);
    return SizedBox(
      height: 450.0.sp,
      child: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        children: [
          DragAndDropLists(
            horizontalAlignment: MainAxisAlignment.center,
            verticalAlignment: CrossAxisAlignment.center,
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
              _buildAddImageButton(context, state),
            ],
          ),
        ],
      ),
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
            margin: EdgeInsets.only(
              right: 18.0.w,
            ),
            width: 275.0.sp,
            height: 413.0.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0.r),
              color: AppColor.gray,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () => cubit.pickImages(state),
                    icon: const Icon(Icons.add_a_photo),
                    iconSize: 30.0.sp,
                    padding: EdgeInsets.all(18.0.sp),
                    constraints: const BoxConstraints(),
                  ),
                ),
                Spacing.vertical(18.0.h),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100.0.r),
                  child: IconButton(
                    onPressed: () => cubit.pickVideo(state),
                    icon: const Icon(Icons.video_call_rounded),
                    iconSize: 30.0.sp,
                    padding: EdgeInsets.all(18.0.sp),
                    constraints: const BoxConstraints(),
                  ),
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
        margin: EdgeInsets.only(
          right: 18.0.w,
        ),
        width: 275.0.sp,
        height: 413.0.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0.r),
          color: AppColor.gray,
        ),
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
              : Image.memory(state.images[index]),
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
      controller: _priceController,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          _priceController.selection = TextSelection.fromPosition(
            TextPosition(offset: _priceController.text.length),
          );
        });

        final String parsedValue = value.replaceAll(r'.', '');
        cubit.checkPrice(state, int.tryParse(parsedValue) ?? -1);
      },
      label: 'Price',
      hintText: '100000',
      validator: (String? value) {
        if (value == null) return 'Value ';

        final String parsedValue = value.replaceAll(r'.', '');

        if (int.tryParse(parsedValue) == null) {
          return 'Price can only consists of numbers';
        }

        int realValue = int.tryParse(parsedValue) ?? -1;
        if (realValue < 0) return 'Price cannot be negative';

        return null;
      },
      suffixIcon: state.price < 0
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
      prefixText: 'Rp',
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        FormValidator.formatCurrency(),
      ],
    );
  }

  Widget _buildStockPrompt(
      BuildContext context, AddProductMobileFormState state) {
    final AddProductMobileCubit cubit =
        BlocProvider.of<AddProductMobileCubit>(context);
    return AppTextFormField(
      onChanged: (stock) => cubit.checkStock(state, int.tryParse(stock) ?? -1),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value == null) return 'Stock cannot be empty';

        if (int.tryParse(value) == null) return 'Stock must be numbers';

        if (int.tryParse(value)! < 0) return 'Stock cannot be negative';
        return null;
      },
      hintText: '0',
      label: 'Stock',
      suffixIcon: state.stock < 0
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
      suffixText: 'books',
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
