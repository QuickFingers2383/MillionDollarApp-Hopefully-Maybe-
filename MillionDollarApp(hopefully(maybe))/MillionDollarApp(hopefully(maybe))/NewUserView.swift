//
//  NewUserView.swift
//  MillionDollarApp(hopefully(maybe))
//
//  Created by David Pidugu on 9/4/21.
//

import SwiftUI

struct NewUserView: View {
    
    @State private var username: String = ""
    @State private var selectedCountry = "United States"
    @State private var selectedState = "Alabama"
    @State private var date = Date()
    
    @State private var isEditing = false
    
    @State var isSelectingCountry = false
    
    let countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]
    
    // Needs to be updated ^
    
    let usState = [ "AK - Alaska",
                  "AL - Alabama",
                  "AR - Arkansas",
                  "AS - American Samoa",
                  "AZ - Arizona",
                  "CA - California",
                  "CO - Colorado",
                  "CT - Connecticut",
                  "DC - District of Columbia",
                  "DE - Delaware",
                  "FL - Florida",
                  "GA - Georgia",
                  "GU - Guam",
                  "HI - Hawaii",
                  "IA - Iowa",
                  "ID - Idaho",
                  "IL - Illinois",
                  "IN - Indiana",
                  "KS - Kansas",
                  "KY - Kentucky",
                  "LA - Louisiana",
                  "MA - Massachusetts",
                  "MD - Maryland",
                  "ME - Maine",
                  "MI - Michigan",
                  "MN - Minnesota",
                  "MO - Missouri",
                  "MS - Mississippi",
                  "MT - Montana",
                  "NC - North Carolina",
                  "ND - North Dakota",
                  "NE - Nebraska",
                  "NH - New Hampshire",
                  "NJ - New Jersey",
                  "NM - New Mexico",
                  "NV - Nevada",
                  "NY - New York",
                  "OH - Ohio",
                  "OK - Oklahoma",
                  "OR - Oregon",
                  "PA - Pennsylvania",
                  "PR - Puerto Rico",
                  "RI - Rhode Island",
                  "SC - South Carolina",
                  "SD - South Dakota",
                  "TN - Tennessee",
                  "TX - Texas",
                  "UT - Utah",
                  "VA - Virginia",
                  "VI - Virgin Islands",
                  "VT - Vermont",
                  "WA - Washington",
                  "WI - Wisconsin",
                  "WV - West Virginia",
                  "WY - Wyoming"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("User Name")
                        .foregroundColor(Color("accent"))
                        .bold()
                    TextField(
                        " User name",
                        text: $username
                    ) { isEditing in
                        self.isEditing = isEditing
                    }.frame(width: 300, height: 30, alignment: .center)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .border(Color(UIColor.separator))

                    Divider().offset(y:20)
                    Spacer()
                    
                    Button(action: { isSelectingCountry.toggle() }) {
                        Text("You selected: \(selectedCountry)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(Color("accent"))
                                    .frame(width: 300, height: 40))
                    .offset(y: 40)
                    
                    Divider().offset(y:60)
                    
                    Text("Enter your birthday")
                        .bold()
                        .font(.largeTitle)
                        .offset(y: 100)
                        .foregroundColor(Color("accent"))
                        
                    DatePicker("Enter your birthday", selection: $date, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxHeight: 800)
                        .offset(y: 100)
                        .frame(width: 300, height: 300, alignment: .center)
                        .accentColor(Color("accent"))
                }
                .navigationBarTitle("Welcome")
            }
        }.sheet(isPresented: $isSelectingCountry) {
            
            Text("Please choose a country").font(.system(.title, design: .rounded)).foregroundColor(Color("accent"))
            
            Text("\(selectedCountry)").font(.system(.subheadline, design: .rounded)).foregroundColor(Color("accent"))
            
            Picker("Please choose a country", selection: $selectedCountry) {
                ForEach(countries, id: \.self) {
                    Text($0)
                }
            }
            
            
            
            if selectedCountry == "United States" {
                Text("Please choose a state (USA)").font(.system(.title, design: .rounded)).foregroundColor(Color("accent"))
                
                Text("\(selectedState)").font(.system(.subheadline, design: .rounded)).foregroundColor(Color("accent"))
                
                Picker("Please choose a state (If from the USA)", selection: $selectedState) {
                    ForEach(usState, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Button("Select",
                   action: {isSelectingCountry.toggle() })
        }
        
    }
}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView()
    }
}
