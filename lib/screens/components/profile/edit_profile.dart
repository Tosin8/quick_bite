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
    _firstNameController = TextEditingController(text: widget.userData['firstName']);
    _lastNameController = TextEditingController(text: widget.userData['lastName']);
    _addressController = TextEditingController(text: widget.userData['address']);
    _phoneNumberController = TextEditingController(text: widget.userData['phoneNumber']);
  }


 
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

 void _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'address': _addressController.text,
          'phoneNumber': _phoneNumberController.text,
        });
        Navigator.pop(context, true); // Pass true to indicate success
      } catch (e) {
        print('Error updating profile: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating profile: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Edit your Profile'), 
        centerTitle: true,
      ) ,
      body:   
            Form(
              key: _formKey, 
              child: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        
                  children: [
                 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                    child: Text('Kindly complete the form below', 
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
                      _isLoading? const CircularProgressIndicator() : AppButton(text: 'Update Profile', onTap: () => _updateProfile,
                        
                  ), 
                  ElevatedButton(
                onPressed: _updateProfile,
                child: Text('Update Profile'),
              ),
                
                  
                  ],
                ),
              ))
          
        
      
    );
  }
}