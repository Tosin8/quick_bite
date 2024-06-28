import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        
      ) ,
      body: Center(
        child:  
            Form(
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
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        //controller: _emailController,
                        decoration: InputDecoration(
                             errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), 
              ), 
              hintText: 'First Name',
            
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
                ],
              ))
          
        
      ),
    );
  }
}