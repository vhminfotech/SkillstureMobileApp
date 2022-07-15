import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillsture_project/controllers/more/edit_profile_page_controller.dart';

import '../../constants/constants_utils.dart';
import '../../constants/country_list.dart';

class EditProfilePage extends GetView<EditProfilePageController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => (controller.isRoleInstructor.value == true)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        color: Color(0xFF262261),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.sendBackProfilePic();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Image.asset(
                                  "assets/images/back@2x.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Edit Profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: "Comfortaa-Bold"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      _getProfileView(),
                      _getNameTextField(),
                      _getEmailTextField(),
                      _getMobileTextField(),
                      _getAddressTextField(),
                      _getSocialProfileTextField(),
                      _getTypeTextField(),
                      _getRegNumberTextField(),
                      _getCompanyWebsiteTextField(),
                      _getIntroductionTextField(),
                      _getExperienceTextField(),
                      _getTeachingAreaTextField(),
                      _getSaveChangesButton(),
                    ],
                  ),
                )
              : SingleChildScrollView(
                child: Column(
                    children: [
                      Container(
                        height: 60,
                        color: Color(0xFF262261),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.sendBackProfilePic();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Image.asset(
                                  "assets/images/back@2x.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Edit Profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: "Comfortaa-Bold"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      _getProfileView(),
                      _getNameTextField(),
                      _getEmailTextField(),
                      _getMobileTextField(),
                      _getSaveChangesButton(),
                    ],
                  ),
              ),
        ),
      ),
    );
  }

  Widget _getProfileView() {
    return Container(
      child: Column(
        children: [
          Obx(
            () => (controller.profilePictureIndicator.value == true)
                ? CircleAvatar(
                    maxRadius: 60,
                    backgroundImage:
                        NetworkImage(controller.profilePicture.value),
                  )
                : CircleAvatar(
                    maxRadius: 60,
                    backgroundColor: Color(0xFFCED0D1),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          'assets/images/user@2x.png',
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              controller.uploadProfilePicture();
            },
            child: Obx(
              () => (controller.profilePictureIndicator.value == true)
                  ? Text(
                      "Change profile picture",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Comfortaa-Bold",
                        color: Color(0xFFF05A28),
                      ),
                    )
                  : Text(
                      "Upload profile picture",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Comfortaa-Bold",
                        color: Color(0xFFF05A28),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSaveChangesButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 20),
      child: RaisedButton(
        color: Color(0xFFF05A28),
        textColor: Colors.white,
        elevation: 1.0,
        onPressed: () {
          controller.updateProfileDetails();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Save Changes",
          style: TextStyle(fontSize: 18.0, fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }

  List<Widget> buildChips() {
    List<Widget> chips = [
      TextButton(
        onPressed: () {
          Get.bottomSheet(
            _getStatusBottomSheet(),
            enableDrag: false,
          );
        },
        child: const Text(
          "Add",
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
              fontFamily: "Comfortaa-Regular"),
        ),
      ),
    ];

    for (int i = 0; i < controller.teachingAreas.value.length; i++) {
      InputChip actionChip = InputChip(
        deleteIcon: const Icon(Icons.clear, color: Color(0xFF262261)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        labelPadding: const EdgeInsets.all(5),
        backgroundColor: const Color(0xFFFEEDC5),
        label: Text(
          controller.teachingAreas.value[i],
          style: const TextStyle(
              fontSize: 16.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Regular"),
        ),
        onDeleted: () {
          controller.removeChipItem(i);
        },
      );
      chips.insert(0, actionChip);
    }
    return chips.map((e) => e).toList();
  }

  Widget _getStatusBottomSheet() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                "Add Skills",
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFF262261),
                  fontFamily: "Cocogoose-Regular",
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  color: Color(0xFF262261),
                  size: 30,
                ),
              ),
            ),
            _getSearchView(),
            ListView.separated(
              itemCount: controller.selectedBottomSheetSkills.value.length,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //controller.checkedBottomStatusColor(index);
                    controller.addChipItem(controller
                        .selectedBottomSheetSkills.value[index]
                        .toString());
                    print(controller.teachingAreas.value);
                    print(controller.selectedBottomSheetSkills.value[index]);
                  },
                  child: Obx(
                    () => ListTile(
                      title: Text(
                        controller.selectedBottomSheetSkills.value[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF262261),
                          fontFamily: "Comfortaa-Regular",
                        ),
                      ),
                      trailing: controller.selectToChangeColour(
                              controller.selectedBottomSheetSkills.value[index])
                          ? Image.asset(
                              "assets/images/checkbox@2x.png",
                              //color: Colors.deepOrangeAccent,
                              height: 20,
                              width: 20,
                            )
                          : Container(
                              //color: Colors.deepOrangeAccent,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Colors.grey.shade400,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSearchView() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10.0, right: 20, bottom: 20),
      child: TextFormField(
        onChanged: (value) {
          print(value.toString());
          controller.searchSkills(value);
        },
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black45,
          fontFamily: "Comfortaa-Regular",
        ),
        cursorColor: Colors.black45,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black45,
          ),
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey),
          focusColor: Colors.black45,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black45,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTeachingAreaTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Teaching Area",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 15.0,
                color: Color(0xFF262261),
                fontFamily: "Comfortaa-Medium"),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 8.0,
              children: buildChips(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Color(0xFFFFB451),
          ),
        ],
      ),
    );
  }

  Widget _getExperienceTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        maxLines: 2,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration: ConstantUtils.styleInputDecoration("Experience"),
        keyboardType: TextInputType.text,
        controller: controller.experienceController,
/*        onSaved: (value) {
          controller.experience = value!;
        },
        validator: (value) {
          return controller.validateTextFormFields(value!, "experience");
        },*/
      ),
    );
  }

  Widget _getIntroductionTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        maxLines: 2,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration:
            ConstantUtils.styleInputDecoration("Introduction (About Yourself)"),
        keyboardType: TextInputType.text,
        controller: controller.introductionController,
/*        onSaved: (value) {
          controller.introduction = value!;
        },
        validator: (value) {
          return controller.validateTextFormFields(value!, "introduction");
        },*/
      ),
    );
  }

  Widget _getCompanyWebsiteTextField() {
    return Obx(
      () => SizedBox(
        child: controller.selectedType.value == "Company"
            ? Container(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF262261),
                      fontFamily: "Comfortaa-Medium"),
                  textInputAction: TextInputAction.next,
                  decoration: ConstantUtils.styleInputDecoration(
                      "Company Website (if any)"),
                  keyboardType: TextInputType.text,
                  controller: controller.websiteController,
/*                  onSaved: (value) {
                    controller.websiteCompany = value!;
                  },*/
                ),
              )
            : Container(
                height: 10,
              ),
      ),
    );
  }

  Widget _getRegNumberTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      margin: const EdgeInsets.only(top: 12),
      child: Obx(
        () => TextFormField(
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: controller.selectedType.value == "Company"
              ? ConstantUtils.styleInputDecoration("Registration Number")
              : ConstantUtils.styleInputDecoration("IC/Passport Number"),
          controller: controller.regNumberController,
/*          validator: (value) {
            return controller.validateRegNumber(value!);
          },
          onSaved: (value) {
            controller.regNumber = value!;
          },
          onChanged: (value) {
            controller.regNumber = value;
          },*/
        ),
      ),
    );
  }

  Widget _getTypeTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.none,
        controller: controller.typeController,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              Get.bottomSheet(
                _getBottomSheetView(),
                enableDrag: false,
              );
            },
            child: Icon(
              Icons.arrow_drop_down_sharp,
              size: 50,
              color: Color(0xFF262261),
            ),
          ),
          labelText: "Company/Individual",
          labelStyle: TextStyle(color: Color(0xFF262261)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
          ), //  border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _getBottomSheetView() {
    return Container(
      color: Colors.white,
      height: 250,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              "Type",
              style: const TextStyle(
                  fontSize: 30.0,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-Bold",
                  fontWeight: FontWeight.bold),
            ),
            trailing: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                color: Color(0xFF262261),
                size: 30,
              ),
            ),
          ),
          ListView.separated(
            itemCount: controller.selectedBottomItem.value.length,
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.checkedBottomItemColor(index);
                  controller.addTextFormFields(
                      controller.selectedBottomItem.value[index]);
                  controller.checkedBottomSheetItem(
                      controller.selectedBottomItem.value[index]);
                  print(controller.selectedBottomItem.value[index]);
                },
                child: Obx(
                  () => ListTile(
                    title: Text(
                      controller.selectedBottomItem.value[index],
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF262261),
                        fontFamily: "Comfortaa-Regular",
                      ),
                    ),
                    trailing: controller.selectedIndex.value == index
                        ? Icon(
                            Icons.check,
                            color: Colors.red,
                            size: 25,
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
                color: Colors.grey.shade400,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _getSocialProfileTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        maxLines: 2,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration: ConstantUtils.styleInputDecoration("Social Profile"),
        keyboardType: TextInputType.text,
        controller: controller.socialProfileController,
/*        validator: (value) {
          return controller.validateSocialProfile(value!);
        },
        onSaved: (value) {
          controller.socialProfile = value!;
        },*/
      ),
    );
  }

  Widget _getAddressTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        maxLines: 2,
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration: ConstantUtils.styleInputDecoration("Address"),
        keyboardType: TextInputType.text,
        controller: controller.addressController,
/*        validator: (value) {
          return controller.validateAddress(value!);
        },
        onSaved: (value) {
          controller.address = value!;
        },*/
      ),
    );
  }

  Widget _getMobileTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        children: <Widget>[
          Row(
            children: [
              CountryCodePicker(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF262261),
                    fontFamily: "Comfortaa-Medium"),
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'MY',
                padding: EdgeInsets.only(right: 0, top: 5),
                flagWidth: 40,
                countryFilter: countryList,
                comparator: (a, b) => b.name!.compareTo(a.name.toString()),
                //Get the country information relevant to the initial selection
                onInit: (code) => print(
                    "on init ${code!.name} ${code.dialCode} ${code.name}"),
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                size: 40,
                color: Color(0xFF262261),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Expanded(
            flex: 4,
            child: TextFormField(
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF262261),
                  fontFamily: "Comfortaa-Medium"),
              textInputAction: TextInputAction.next,
              maxLength: 14,
              decoration: ConstantUtils.styleInputDecoration("Mobile"),
              keyboardType: TextInputType.number,
              controller: controller.mobileController,
/*              validator: (value) {
                return controller.validateMobile(value!);
              },
              onSaved: (value) {
                controller.mobile = value!;
              },*/
            ),
          ),
        ],
      ),
    );
  }

  Widget _getEmailTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      margin: const EdgeInsets.only(top: 12),
      child: TextFormField(
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: ConstantUtils.styleInputDecoration("Email"),
        controller: controller.emailController,
/*        validator: (value) {
          return controller.validateEmail(value!);
        },
        onSaved: (value) {
          controller.email = value!;
        },
        onChanged: (value) {
          controller.email = value;
        },*/
      ),
    );
  }

  Widget _getNameTextField() {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: TextFormField(
        style: const TextStyle(
            fontSize: 20.0,
            color: Color(0xFF262261),
            fontFamily: "Comfortaa-Medium"),
        textInputAction: TextInputAction.next,
        decoration: ConstantUtils.styleInputDecoration("Name"),
        keyboardType: TextInputType.text,
        controller: controller.nameController,
/*        validator: (value) {
          return controller.validateName(value!);
        },
        onSaved: (value) {
          controller.name = value!;
        },*/
      ),
    );
  }
}
