import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/constants/domains.dart';
import 'package:inabe/src/data/model/electronic_app_model.dart';
import 'package:inabe/src/navigation/app_routers.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/presenter/electronic_apps/electronic_apps_view_model.dart';
import 'package:inabe/src/presenter/widget/custom_dropdown.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';
import 'package:inabe/src/utils/uri_utils.dart';
import 'package:inabe_design/dimens.dart';

class ElectronicAppDropdownWidget
    extends ConsumerViewModelWidget<ElectronicAppViewModel> {
  const ElectronicAppDropdownWidget({Key? key}) : super(key: key);

  @override
  AutoDisposeProvider<ElectronicAppViewModel> viewModelProvider() {
    return electronicAppViewModelProvider;
  }

  List<MiddleCategories>? getMidCate(
      List<ElectronicAppModel> listElectronic, String selectCategory) {
    List<MiddleCategories>? midCategories;

    if (selectCategory.isNotEmpty) {
      midCategories = listElectronic
          .firstWhere((element) => element.name == selectCategory)
          .middleCategories;
      return midCategories!;
    }
    return null;
  }

  List<Procedures>? getProcedures(
      List<MiddleCategories> listElectronic, String selectMidCategory) {
    List<Procedures>? procedures;

    if (selectMidCategory.isNotEmpty) {
      procedures = listElectronic
          .firstWhere((element) => element.name == selectMidCategory)
          .procedures;
      return procedures!;
    }
    return null;
  }

  @override
  Widget buildWidget(
      BuildContext context, WidgetRef ref, ElectronicAppViewModel viewModel) {
    final listElectronic = ref.watch(viewModel.electronicAppProvider);
    final selectCategory = ref.watch(viewModel.selectCategory);
    final selectMidCategory = ref.watch(viewModel.selectMidCategory);
    print("ttt --- electronic:: $selectCategory:::$selectMidCategory");

    return listElectronic.when(data: (data) {
      final listMidCategories = getMidCate(data, selectCategory);
      List<Procedures>? listProcedure;
      if (listMidCategories != null) {
        listProcedure = getProcedures(listMidCategories, selectMidCategory);
      }
      print("ttt --- electronic return:: $selectCategory:::$selectMidCategory");
      print("ttt --- listProcedure return:: ${listProcedure?.length ?? -1}");
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customDropDown(data, selectCategory, ref),
          if (selectCategory.isNotEmpty)
            Center(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  height: 14,
                  child: Assets.images.icDropdownBottom.image()),
            ),
          if (selectCategory.isNotEmpty)
            mediumCategory(listMidCategories!, selectMidCategory, ref),
          if (selectMidCategory.isNotEmpty)
            if (selectCategory.isNotEmpty)
              Center(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    height: 14,
                    child: Assets.images.icDropdownBottom.image()),
              ),
          if (selectMidCategory.isNotEmpty && listProcedure != null)
            _buildProcedures(context, listProcedure, ref),
        ],
      );
    }, error: (error, strace) {
      return Container();
    }, loading: () {
      return Container();
    });
  }

  DropdownButton<ElectronicAppModel> dropdownButtonWidget(
      List<ElectronicAppModel> list) {
    return DropdownButton<ElectronicAppModel>(
      value: list.first,
      items: list.map<DropdownMenuItem<ElectronicAppModel>>((e) {
        return DropdownMenuItem(value: e, child: Text(e.name ?? ""));
      }).toList(),
      onChanged: (ElectronicAppModel? value) {},
    );
  }

  CustomDropDown customDropDown(
      List<ElectronicAppModel> list, String category, WidgetRef ref) {
    return CustomDropDown(
      title: str.electronic_app_choose_category,
      key: const Key("category"),
      hint: str.please_select_hint,
      value: category,
      items: list.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem(value: e.name, child: Text(e.name ?? ""));
      }).toList(),
      onChanged: (v) {
        print("ttt change customDropDown $v");
        viewModel(ref).setSelectedCategory(v);
      },
    );
  }

  CustomDropDown mediumCategory(
      List<MiddleCategories> list, String midCategory, WidgetRef ref) {
    return CustomDropDown(
      title: str.electronic_app_choose_medium_category,
      key: const Key("midCategory"),
      hint: str.please_select_hint,
      value: midCategory,
      items: list.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem(value: e.name, child: Text(e.name ?? ""));
      }).toList(),
      onChanged: (v) {
        print("ttt change mediumCategory $v");
        viewModel(ref).setSelectedMidCategory(v);
      },
    );
  }

  Widget _buildProcedures(
      BuildContext context, List<Procedures> procedures, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(Dimens.size10),
      child: Column(
        children: [
          Text(
            str.electronic_app_list_procedures,
            style: textStyle.medium.w700.fill(ColorName.carbonGrey),
          ),
          const SizedBox(height: Dimens.size20),
          Row(
            children: [
              Container(
                width: Dimens.size4,
                height: Dimens.size20,
                color: ColorName.greenB7,
              ),
              const SizedBox(width: Dimens.size4),
              Text(
                str.electronic_app_list_procedures,
                style: textStyle.medium.w700.fill(ColorName.carbonGrey),
              ),
            ],
          ),
          const SizedBox(height: Dimens.size10),
          const Divider(
            height: 1,
            color: ColorName.dividerGray,
          ),
          if (procedures.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.size20),
              child: Text(
                str.electronic_app_empty_form,
                style: textStyle.medium.w400.fill(ColorName.carbonGrey),
              ),
            ),
          ...procedures.map((e) => _buildItemProcedure(e, context)).toList(),
        ],
      ),
    );
  }

  Widget _buildItemProcedure(Procedures procedures, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Dimens.size10),
        Text(
          procedures.name ?? '',
          style: textStyle.medium.w400.fill(ColorName.carbonGrey),
        ),
        const SizedBox(height: Dimens.size10),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => openUrl(context, procedures.detailUrl),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: ColorName.dividerGray),
                ),
                child: Text(
                  str.procedure_information,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle.medium.w400.fill(ColorName.carbonGrey),
                ),
              ),
            ),
            const SizedBox(width: Dimens.normalPadding),
            Expanded(
              child: ElevatedButton(
                onPressed: () => openUrl(context, procedures.formUrl),
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorName.greenSnake),
                child: Center(
                  child: Text(
                    str.electronic_app_form,
                    style: textStyle.medium.w400.fill(Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimens.size10),
        const Divider(
          height: 1,
          color: ColorName.dividerGray,
        ),
      ],
    );
  }

  void openUrl(BuildContext context, String? url) {
    if (url?.contains(DomainConst.URL) == true) {
      launchWebPage(
        context,
        "${RouterConstants.home}/${RouterConstants.electronic_app}",
        url,
      );
    } else {
      UriUtils.launchActionOutside(data: url);
    }
  }
}
