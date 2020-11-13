# Plans

## Required
These are features REQUIRED by the task

* Can record car repair with with details
* Records can be tagged with multiple things, and we can sort by it
* Records hold a reason
* Notifications based on upcoming events (based on date or kilometers)
* Can record refuelling, and get statistics from it
* Statistics for each components in the car
* Automatic insurance policy notification

## Features
These are features added by us

* Multiple car support
* Prediction for kilometers based notification
* Electric car support
* Countdown till your insurance invalidates itself and their lawyers hunt you down
* Google sync
* Car suggestion
* Pretty charts
* Google calendar integration for notifications

## Third party services
These are the third party services we are going to use

* Car database? It exists... limited... 

[Option a](https://vpic.nhtsa.dot.gov/api/) [Option b](https://www.fueleconomy.gov/feg/ws/index.shtml)

Option a: Get all Manufacturers > Get makes for manufacturer > Get models by make

* \(?\) Márka szervíz API?

## Routes 
 - /settings:
    You can edit your profile here
    * Login to your google
    * Export your data
    * Synchronize with cloud
    * Enable google calendar synchronization
    * Language setting
    * Dark theme

 - /cars:
    Choose cars here.

 - /cars/add:
    Add cars

 - /cars/:id
    View/edit the chosen car

 - /cars/:id/statistics
    View statistics


 - /cars/:id/repairs
    View and choose repairs

 - /cars/:id/repairs/add
    Add repair

 - /cars/:id/repairs/:id
    View chosen repair

 - /cars/:id/repairs/:id/edit
    Edit chosen repair
 

 - /cars/:id/refuels
    View and choose refuels

 - /cars/:id/refuels/add
    Add refuel

 - /cars/:id/refuels/:id
    View chosen refuel

- /cars/:id/refuels/:id/edit
    Edit chosen refuel


 - /cars/:id/reminders
    View and choose reminders

 - /cars/:id/reminders/add
    Add reminder

 - /cars/:id/reminders/:id
    View chosen reminder

- /cars/:id/reminders/:id/edit
    Edit chosen reminder


