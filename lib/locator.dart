import 'package:aircraftclosingroom/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

/*
Container(
                height: 300,
                width: 300,
                child: closingCardsWidget(
                  tailNumber: 'f',
                  title: 'f',
                  transparent: false,
                  invObjType: 'f',
                  sNumber: 'd',
                  agentName: 'f',
                  make: 'f',
                  model: 'f',
                  closingID: 'f',
                  color: ThemeProvider.primaryAccent,
                  context: context,
                  orderDate: 'f',
                  status: 'f',
                  featuredPicture: AssetImage('assets/images/AIC.png'),
                ),
              ),
*/
