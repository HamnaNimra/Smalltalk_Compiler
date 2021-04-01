
Object subclass: #Truck
  instanceVariableNames: 
    ' driver passengers loads '
  classVariableNames: ''
  poolDictionaries: ''
  category: 'Random Experimentation'
!


!Truck class methodsFor: 'instance creation'!
 
new

    ^super new initialize! !

!Truck class methodsFor: 'examples'!
 
example1
    "Truck example1"
    | aTruck |
    aTruck := Truck new driver: #Jim.
    aTruck addPassenger: #Tom; addPassenger: #Dayton.
    aTruck addLoad: #Wheelbarrow; addLoad: #Ladder; addLoad: #Cement.
    aTruck driverDo: [:driver | Transcript cr; << 'The driver is '; << driver].
    aTruck passengersDo: [:passenger | Transcript cr; << 'One passenger is '; << passenger].
    aTruck loadDo: [:load | Transcript cr; << 'The back of the truck contains a '; << load].
    "Method do: sequences over everything in the truck."
    aTruck do: [:anObject | Transcript cr; << 'In the truck, there is a '; << anObject].! !


!Truck methodsFor: 'initializing'!
 
initialize

    self
        passengers: OrderedCollection new;
        loads: OrderedCollection new;
        driver: String new! !

!Truck methodsFor: 'get/set'!
   
driver
    ^driver!

passengers
    ^passengers!

loads: anOrderedCollection
    loads := anOrderedCollection!
   
passengers: anOrderedCollection
    passengers := anOrderedCollection!
 
loads
    ^loads!
  
driver: aString
    driver := aString! !

!Truck methodsFor: 'doMethods'!

passengersDo: anOutputStream
    self passengers isEmpty
    ifFalse: [ anOutputStream value: self passengers first. ]
    ifTrue: [ anOutputStream value: 'Empty'. ].!
  
do: anOutputStream
    |aBufferString|
    aBufferString:=''.

    self driver isEmpty 
        ifFalse: [
            aBufferString := aBufferString, Character cr asString.
            aBufferString := aBufferString, 'Driver: ', self driver asString.
         ].
         
    self passengers isEmpty 
         ifFalse: [
             aBufferString := aBufferString, Character cr asString.
             aBufferString := aBufferString, 'Passengers:'.
             1 to: self passengers size do: [:index| aBufferString := aBufferString, ' ', (self passengers at: index)].
          ].
          
    self loads isEmpty
        ifFalse:[
            aBufferString := aBufferString, Character cr asString.
            aBufferString := aBufferString, 'Loads:'.
            1 to: self loads size do: [:index| aBufferString := aBufferString, ' ', (self loads at: index)].
         ].
    anOutputStream value: aBufferString!
   
driverDo: anOutputStream
    anOutputStream value: self driver!

loadDo: anOutputStream
    self loads isEmpty
    ifFalse: [ anOutputStream value: self loads first. ]
    ifTrue: [ anOutputStream value: 'Empty'. ].! !

!Truck methodsFor: 'addMethods'!

addPassenger: aString
    passengers add: aString!
 
addLoad: aString
    loads add: aString! !

Truck comment: 'Truck example1'!
