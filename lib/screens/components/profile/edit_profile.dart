import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/components/form/app_button.dart';

class EditProfile extends StatefulWidget {
 
  final String userId;
  final Map<String, dynamic> userData;

  const EditProfile({required this.userId, required this.userData});


  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
final _formKey = GlobalKey<FormState>();
late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneNumberController;

bool _isLoading = false; 

@override
    void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.userData['first_name']);
    _lastNameController = TextEditingController(text: widget.userData['last_name']);
    _addressController = TextEditingController(text: widget.userData['address']);
    _phoneNumberController = TextEditingController(text: widget.userData['phone_number']);
  }


  void _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
        'first_name': _firstNameController.text,
        'last_name': _lastNameController.text,
        'address': _addressController.text,
        'phone_number': _phoneNumberController.text,
      });
      Navigator.pop(context);
    }
  }
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        
      ) ,
      body: Center(
        child:  
            Form(
              key: _formKey, 
              child: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        
                  children: [
                 //   const SizedBox(height:10), 
                    // logo
                    Center(
                      child: Container(
                        width: 80, height: 80, child: Image.asset('assets/icons/logo.png'),
                      ),
                    ),
                    const SizedBox(height: 20,), 
                    Center(
                      child: Text('Quick Bite', style: TextStyle(fontSize: 16, 
                      color: Theme.of(context).colorScheme.inverseSurface,  ),),
                    ), 
                    const SizedBox(height: 5,), 
                    Center(
                      child: Text('Update your Profile', 
                      style: TextStyle(
                        fontSize: 16, 
                        color: Theme.of(context).colorScheme.inverseSurface, 
                      ),),
                    ),  
                   
                    const SizedBox(height: 15,), 
                      
                    // first Name. 
                     Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          controller: _firstNameController,
                          decoration: InputDecoration(
                               errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
                ), 
                hintText: 'Change your First Name',
                            
                 hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
                           labelText: 'First Name'
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }  
                            return null;
                          
                          
                          },
                        ),
                      ),
                
                           // last Name. 
                     Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          controller: _lastNameController,
                          decoration: InputDecoration(
                               errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
                ), 
                hintText: 'Change your Last Name',
                            
                 hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
                           labelText: 'Last Name'
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }  
                            return null;
                          
                          
                          },
                        ),
                      ),
                
                      // address
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          controller: _addressController,
                          decoration: InputDecoration(
                               errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
                ), 
                hintText: 'Change your Address',
                            
                 hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
                           labelText: 'Address'
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }  
                            return null;
                          
                          
                          },
                        ),
                      ),
                
                      // phone no. 
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical:10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                               errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
                ), 
                hintText: 'Change your Phone Number',
                            
                 hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), 
                           labelText: 'Phone Number'
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length != 11) {
                              return 'Please enter a valid phone number';
                            }  
                            return null;
                          
                          
                          },
                        ),
                      ),
                      const SizedBox(height: 30,), 
                      _isLoading? const CircularProgressIndicator() : AppButton(text: 'Update Profile', onTap: () => _updateProfile
                        
                  ,)
                
                  
                  ],
                ),
              ))
          
        
      ),
    );
  }
}