using AirframerService as ai from '../srv/AirframerService';

//
// annotations that control the behavior of fields and actions
//

annotate ai.Airframer {
    Name @mandatory;
}

annotate ai.Program {
    Name @mandatory;
}

annotate ai.Component {
    Name @mandatory;
}
