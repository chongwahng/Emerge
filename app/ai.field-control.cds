using AirframerService as ai from '../srv/AirframerService';

//
// annotations that control the behavior of fields and actions
//

annotate ai.Airframer {
    code @mandatory;
    Name @mandatory;
}

annotate ai.Program {
    code @mandatory;
    Name @mandatory;
}

annotate ai.Component {
    code @mandatory;
    Name @mandatory;
}
