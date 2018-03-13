function num_classes = findUndeclaredClasses()
    num_classes = 1;
    [num, text] = xlsread('CCC.xlsx','K2751:K3670'); 
    
    for ii = 2: length(text)
        if ~strcmp(text(ii),text(ii-1))
            num_classes = num_classes + 1;
        end
    end
end
