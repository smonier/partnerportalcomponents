const buildAndFireSearchEvent = searchTerm => {
    if (!window.wem) {
        return;
    }
    console.info("searchTerm: " + searchTerm);
    const searchEvent = window.wem.buildEvent('search',
        window.wem.buildTarget('cocktailSearchForm', 'form'),
        window.wem.buildSourcePage()
    );

    searchEvent.properties = {
        originForm: 'cocktailSearchForm',
        language: window.contextJsParameters.lang,
        keyword: searchTerm,
        origin: location.pathname
    };
    window.wem.collectEvent(searchEvent,
        () => console.debug('[buildAndFireSearchEvent] search formEvent sent'),
        () => console.debug('[buildAndFireSearchEvent] oups search formEvent was not handled properly')
    );
};

const buildAndFireClickEvent = buttonId => {
    if (!window.wem) {
        return;
    }
    console.info("buttonId: " + buttonId);
    const clickEvent = window.wem.buildEvent('click',
        window.wem.buildTarget(buttonId, 'link'),
        window.wem.buildSourcePage()
    );

    window.wem.collectEvent(clickEvent,
        () => console.debug('[buildAndFireClickEvent] clickEvent sent'),
        () => console.debug('[buildAndFireClickEvent] oups clickEvent was not handled properly')
    );
};

