import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
final _formKey = GlobalKey<FormState>();
final _firstNameController = TextEditingController(); 
final _lastNameController = TextEditingController(); 
final _phoneNumberController = TextEditingController(); 
final _addressController = TextEditingController(); 

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
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text('Update your Profile', 
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
                    ),
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
                ],
              ))
          
        
      ),
    );
  }
}