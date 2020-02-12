#<#
param([switch]$Elevated)
function Check-Admin {
$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Check-Admin) -eq $false)  {
if ($elevated)
{
# could not elevate, quit
}
 
else {
Start-Process powershell.exe -Verb RunAs -ArgumentList (' -ExecutionPolicy Bypass -noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}
exit
}
#>
#Set-ExecutionPolicy Bypass -Scope Process
#----------------------------------------------------- Run your code that needs to be elevated here -----------------------------------------------------

    #ERASE ALL THIS AND PUT XAML BELOW between the @" "@ 
$inputXML = @"
<Window x:Name="MainWindow1" x:Class="InfoUserTest.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:InfoUserTest"
        mc:Ignorable="d"
        Title="InfoUser" Height="450" Width="800" MinWidth="800" MinHeight="450" VerticalContentAlignment="Top" HorizontalContentAlignment="Left" Grid.IsSharedSizeScope="True">
    <Grid>
        <Grid.Background>
            <LinearGradientBrush EndPoint="0.5,1" StartPoint="0.5,0">
                <GradientStop Color="White"/>
                <GradientStop Color="#FFE6E6E6" Offset="1"/>
            </LinearGradientBrush>
        </Grid.Background>
        <Grid.ColumnDefinitions>
            <ColumnDefinition/>
            <ColumnDefinition Width="2*"/>
        </Grid.ColumnDefinitions>
        <Grid Margin="5,5,5,5">
            <Grid.RowDefinitions>
                <RowDefinition Height="2*"/>
                <RowDefinition/>
                <RowDefinition Height="2*"/>
            </Grid.RowDefinitions>
            <Grid>
                <Grid.RowDefinitions>
                    <RowDefinition Height="3*"/>
                    <RowDefinition/>
                </Grid.RowDefinitions>
                <Image x:Name="Main_Picture" Source="C:\ProgramData\Microsoft\User Account Pictures\guest.png"/>
                <Viewbox Grid.Row="1" Stretch="Uniform" StretchDirection="Both" HorizontalAlignment="Stretch" VerticalAlignment="Bottom">
                    <Label x:Name="Main_Label" Content="Unknown" HorizontalContentAlignment="Center" VerticalContentAlignment="Center" FontWeight="Bold" FlowDirection="LeftToRight" HorizontalAlignment="Center" VerticalAlignment="Center" BorderThickness="5,5,5,5" FontSize="72"/>
                </Viewbox>
            </Grid>
            <GroupBox x:Name="GP_Search" Header="Search" Grid.Row="1">
                <Grid>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="2*"/>
                        <RowDefinition Height="*"/>
                    </Grid.RowDefinitions>
                    <TextBox x:Name="GP_Search_TextBox" HorizontalAlignment="Stretch" Text="Search user here" TextWrapping="Wrap" VerticalAlignment="Stretch" HorizontalContentAlignment="Center" VerticalContentAlignment="Center" Margin="5,0,5,0"/>
                    <Grid Grid.Row="1">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition/>
                            <ColumnDefinition/>
                        </Grid.ColumnDefinitions>
                        <Button x:Name="GP_Search_Button_Clear" Content="Clear" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Margin="5,0,5,0"/>
                        <Button x:Name="GP_Search_Button_Search" Content="Search" Grid.Column="1" HorizontalAlignment="Stretch" Margin="5,0,5,0" VerticalAlignment="Stretch"/>
                    </Grid>
                </Grid>
            </GroupBox>
            <GroupBox x:Name="GP_Password" Header="Password" Grid.Row="2" IsEnabled="False">
                <Grid Margin="1,1,1,1">
                    <Grid.RowDefinitions>
                        <RowDefinition Height="6*"/>
                        <RowDefinition/>
                    </Grid.RowDefinitions>
                    <Grid Grid.Row="1">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="3*"/>
                            <ColumnDefinition/>
                        </Grid.ColumnDefinitions>
                        <CheckBox x:Name="GP_Password_Checkbox" Content="Change password at logon" HorizontalAlignment="Stretch" VerticalAlignment="Stretch"/>
                        <Button x:Name="GP_Password_Button" Content="Change" Grid.Column="1" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Margin="1,1,1,1"/>
                    </Grid>
                    <TabControl x:Name="TabPassword">
                        <TabItem x:Name="TabPassword_Modify" Header="Modify">
                            <Grid Background="#FFE5E5E5" Margin="1,1,1,1" HorizontalAlignment="Stretch">
                                <Grid.RowDefinitions>
                                    <RowDefinition Height="3*"/>
                                    <RowDefinition Height="3*"/>
                                    <RowDefinition Height="3*"/>
                                    <RowDefinition Height="3*"/>
                                    <RowDefinition/>
                                </Grid.RowDefinitions>
                                <PasswordBox x:Name="GP_Password_NewPassword_TextBox" HorizontalAlignment="Stretch" Grid.Row="1" VerticalAlignment="Stretch" Margin="5,0,5,0" HorizontalContentAlignment="Center" VerticalContentAlignment="Center"/>
                                <PasswordBox x:Name="GP_Password_ConfirmNewPassword_TextBox" Grid.Row="3" Margin="5,0,5,0" VerticalContentAlignment="Center" HorizontalContentAlignment="Center"/>
                                <Viewbox HorizontalAlignment="Left" VerticalAlignment="Bottom" UseLayoutRounding="False" StretchDirection="DownOnly">
                                    <Label x:Name="L_Password_NewPassword" Content="New password:" HorizontalAlignment="Stretch"/>
                                </Viewbox>
                                <Viewbox Grid.Row="2" HorizontalAlignment="Left" VerticalAlignment="Bottom" StretchDirection="DownOnly">
                                    <Label x:Name="L_Password_ConfirmNewPassword" Content="Confirm new password:" Padding="5,5,5,5" Width="156" VerticalContentAlignment="Bottom"/>
                                </Viewbox>
                            </Grid>
                        </TabItem>
                        <TabItem x:Name="TabPassword_Randomise" Header="Randomise">
                            <Grid Background="#FFE5E5E5" Margin="1,1,1,1">
                                <Grid.RowDefinitions>
                                    <RowDefinition Height="1.25*"/>
                                    <RowDefinition Height="1.25*"/>
                                    <RowDefinition Height="*"/>
                                </Grid.RowDefinitions>
                                <Grid Grid.Row="2">
                                    <Grid.ColumnDefinitions>
                                        <ColumnDefinition/>
                                        <ColumnDefinition/>
                                    </Grid.ColumnDefinitions>
                                    <Button x:Name="GP_Password_Button_Randomise" Content="Randomise" Grid.Column="1" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Margin="5,5,5,5"/>
                                </Grid>
                                <TextBox x:Name="GP_Password_Randomise_TextBox" HorizontalAlignment="Stretch" Grid.Row="1" Text="Randomise password" TextWrapping="Wrap" VerticalAlignment="Stretch" HorizontalContentAlignment="Center" VerticalContentAlignment="Center" Margin="5,0,5,0" IsUndoEnabled="False" IsReadOnly="True"/>
                                <Viewbox HorizontalAlignment="Left" VerticalAlignment="Bottom" StretchDirection="DownOnly">
                                    <Label Content="Randomise password:" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" VerticalContentAlignment="Bottom"/>
                                </Viewbox>
                            </Grid>
                        </TabItem>
                    </TabControl>
                </Grid>
            </GroupBox>
        </Grid>
        <Grid Grid.Column="1" Margin="5,5,5,5">
            <Grid>
                <Grid.RowDefinitions>
                    <RowDefinition Height="2*"/>
                    <RowDefinition/>
                </Grid.RowDefinitions>
                <GroupBox x:Name="GP_Lock" Header="Lock Status" Grid.Row="1" IsEnabled="False">
                    <Grid>
                        <Grid.RowDefinitions>
                            <RowDefinition Height="3*"/>
                            <RowDefinition/>
                        </Grid.RowDefinitions>
                        <Grid Grid.Row="1">
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition/>
                                <ColumnDefinition/>
                            </Grid.ColumnDefinitions>
                            <Button x:Name="GP_Status_Button_Verify" Content="Verify" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Margin="5,5,5,5"/>
                            <Button x:Name="GP_Status_Button_Unlock" Content="Unlock" Grid.Column="1" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Margin="5,5,5,5"/>
                        </Grid>
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition/>
                                <ColumnDefinition Width="10*"/>
                            </Grid.ColumnDefinitions>
                            <Viewbox>
                                <Label x:Name="GP_Lock_Label" Content="s" HorizontalContentAlignment="Stretch" VerticalContentAlignment="Stretch" FontFamily="Webdings" HorizontalAlignment="Center" VerticalAlignment="Center" RenderTransformOrigin="0.5,0.5">
                                    <Label.Background>
                                        <RadialGradientBrush SpreadMethod="Pad" GradientOrigin="0.5,0.5">
                                            <RadialGradientBrush.RelativeTransform>
                                                <TransformGroup>
                                                    <ScaleTransform/>
                                                    <SkewTransform/>
                                                    <RotateTransform/>
                                                    <TranslateTransform X="0"/>
                                                </TransformGroup>
                                            </RadialGradientBrush.RelativeTransform>
                                            <GradientStop Offset="1"/>
                                            <GradientStop Color="#BFFFFFFF" Offset="0.5"/>
                                        </RadialGradientBrush>
                                    </Label.Background>
                                </Label>
                            </Viewbox>
                            <DataGrid x:Name="GP_Lock_DataGrid" Grid.Column="1" ColumnWidth="*" SelectionMode="Extended" CanUserAddRows="False" CanUserDeleteRows="False" CanUserResizeRows="False" CanUserReorderColumns="False" IsReadOnly="True">
                                <DataGrid.Columns>
                                    <DataGridTextColumn Binding="{Binding Time}" Header="Time:" Width="Auto"/>
                                    <DataGridTextColumn Binding="{Binding User}" Header="User:" Width="*"/>
                                    <DataGridTextColumn Binding="{Binding Status}" Header="Status:" Width="Auto"/>
                                </DataGrid.Columns>
                            </DataGrid>
                        </Grid>
                    </Grid>
                </GroupBox>
                <GroupBox x:Name="GP_Informations" Header="Informations" IsEnabled="False">
                    <Grid>
                        <Grid.RowDefinitions>
                            <RowDefinition Height="8*"/>
                            <RowDefinition/>
                        </Grid.RowDefinitions>
                        <Grid Grid.Row="1">
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition/>
                                <ColumnDefinition/>
                            </Grid.ColumnDefinitions>
                            <Button x:Name="GP_Informations_Button" Content="Refresh" Grid.Column="1" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Margin="5,5,5,5"/>
                        </Grid>
                        <DataGrid x:Name="GP_Informations_DataGrid" ColumnWidth="*" SelectionUnit="Cell" CanUserAddRows="False" CanUserDeleteRows="False" CanUserResizeRows="False" IsReadOnly="True">
                            <DataGrid.Columns>
                                <DataGridTextColumn Binding="{Binding Attributes}" Header="Attributes:" Width="Auto"/>
                                <DataGridTextColumn Header="Values:" Binding="{Binding Values}"/>
                            </DataGrid.Columns>
                        </DataGrid>
                    </Grid>
                </GroupBox>
            </Grid>
        </Grid>
    </Grid>
</Window>
"@

$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N' -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[xml]$XAML = $inputXML
#Read XAML

    $reader=(New-Object System.Xml.XmlNodeReader $xaml) 
  try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
catch [System.Management.Automation.MethodInvocationException] {
    Write-Warning "We ran into a problem with the XAML code.  Check the syntax for this control..."
    write-host $error[0].Exception.Message -ForegroundColor Red
    if ($error[0].Exception.Message -like "*button*"){
        write-warning "Ensure your &lt;button in the `$inputXML does NOT have a Click=ButtonClick property.  PS can't handle this`n`n`n`n"}
}
catch{#if it broke some other way :D
    Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."
        }

#===========================================================================
# Store Form Objects In PowerShell
#===========================================================================

$xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}

Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
get-variable WPF*
}

Get-FormVariables

#===========================================================================
# Use this space to add code to the various form elements in your GUI
#===========================================================================

#==============================================================================
#=  __        __   __            ==============================================
#==/ _` |    /  \ |__)  /\  |    ==============================================
#==\__> |___ \__/ |__) /~~\ |___ ==============================================
#=                               ==============================================
#==============================================================================
#http://patorjk.com/software/taag/#p=display&f=JS%20Stick%20Letters&t=Functions
#==============================================================================

    #This is the variable use to get the Identities of the User selected.
        $global:Current_User_Identities = ""
    #Get the current Domain name and Minimum password lenght 
        $global:CurrantDomain = (Get-ADDomain -Current LocalComputer).dnsroot
        $global:MinPasswordLength = (Get-ADDefaultDomainPasswordPolicy -Identity $global:CurrantDomain).MinPasswordLength
        $global:PasswordComplexityEnabled = (Get-ADDefaultDomainPasswordPolicy -Identity $global:CurrantDomain).ComplexityEnabled
    #The attributes show in the Informations Datagrid. Must be a valable Attributes in the AD.
        [array]$Informations_DataGrid_AttributesList = "Name","SamAccountName","Title","Department","mail","Office","OfficePhone","State","Manager","Enabled","accountExpires","PasswordExpired","PasswordLastSet", "LockedOut","LastLogonDate","AccountExpirationDate"
    #The attributes show in the OutGridView windows when you select the user found from the Text entered into the search box.
    #Must be a valable Attributes in the AD.
        [array]$Search_OutGridView_Columns_AttributesList= "displayName","sAMAccountName","description","title","telephoneNumber","mail"
    #The text show in the OutgridView Title
        [string]$Search_OutGridView_Title = "Choose an user and press OK."
    #The content of the main label show. Must be a valable Attributes in the AD.
        [string]$Main_Label_Text_Shown = "Name" #Text that appear into the main label. Name,CN,DisplayName,UserPrincipalName, ou sAMAccountName
#==============================================================================
#http://patorjk.com/software/taag/#p=display&f=JS%20Stick%20Letters&t=Functions
#============================================================================== 

#==============================================================================
#=  ___            __  ___    __        __   ==================================
#== |__  |  | |\ | /  `  |  | /  \ |\ | /__` ==================================
#== |    \__/ | \| \__,  |  | \__/ | \| .__/ ==================================
#=                                           ==================================
#==============================================================================
#Commun function use into the script

#http://patorjk.com/software/taag/#p=display&f=JS%20Stick%20Letters&t=Functions
#==============================================================================                                    

function GenerateWarningForm 
{
	    <#
    .SYNOPSIS 
    Generate a Yes/no Warning Pop up with a custom title and message.

    .DESCRIPTION
    Generate an error window with supply information.
	.PARAMETER ButtonType
	OK OKCancel YesNo YesNoCancel
	.PARAMETER ButtonType
	Hand Question Exclamation Asterisk Stop Error Warning Information
	.EXAMPLE
	GenerateWarningForm -MessageboxTitle "You title here" -Messageboxbody "You message here"
	Return True if yes and False if no
	#>
	param (
		[Parameter(Mandatory=$True, 
		Position=0)]  
		[String]$MessageboxTitle,

		[Parameter(Mandatory=$True, 
		Position=1)]  
		[String]$Messageboxbody,

		[Parameter(Mandatory=$True, 
		Position=2)]
		[ValidateSet("OK","OKCancel","YesNo","YesNoCancel")]  
		[String]$ButtonType,

		[Parameter(Mandatory=$True, 
		Position=3)]
		[ValidateSet("Hand","Question","Exclamation","Asterisk","Stop","Error","Warning","Information")]  
		[String]$MessageIcon
		)

	#Import the Presentation Framework–related libraries into the current PowerShell session.
	Add-Type -AssemblyName PresentationCore,PresentationFramework
	#Yes No type message Box
	#Message Icon type Warning
	#$MessageIcon = [System.Windows.MessageBoxImage]::Warning

	$TextAnswer= [System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,([System.Windows.MessageBoxButton]::$ButtonType),([System.Windows.MessageBoxImage]::$MessageIcon))

    Return $TextAnswer
}

function ChangeUserPassword {
	param (
		[Parameter(Mandatory=$True,
		#ValueFromPipeline=$True,
		#ValueFromPipelineByPropertyName=$True,
		Position=0)]
		[String]$Identity,
		
		[Parameter(Mandatory=$True, Position=1)]
		[System.Security.SecureString]$Password,

		[switch]$ChangePasswordAtLogon =$false
	)

	$StatusPassword = $false
	$StatusChangePasswordAtLogon =$false
	
	if ([string]::IsNullOrEmpty($Identity) -or [string]::IsNullOrEmpty($Password) ) 
	{
		Break;	
	}
	else 
	{
		try 
		{
			Set-ADAccountPassword -Identity $Identity -NewPassword $Password
			$StatusPassword = $True
			if ($ChangePasswordAtLogon.IsPresent) 
			{
				Set-ADUser -Identity $Identity -ChangePasswordAtLogon $True	
				$StatusChangePasswordAtLogon = $True
				if ($StatusChangePasswordAtLogon -and $StatusPassword) 
				{
					$Output =$True #No Error Send Output True
				}
				else 
				{
					$Output =$false	#Error send Output False
				}
			}
			else 
			{
				if ($StatusPassword -eq $True) 
				{
					$Output =$True #No Error Send Output True
				}
				else
				{
					$Output =$false	#Error send Output False
				}	
			}
		}
		catch 
		{
			$Output = $False
			throw "ERROR: Coudn't change the password."
		}
	}
	return $Output
}

function GetAdUserPhoto {
    Param (                        
        [Parameter(Mandatory=$True, 
            Position=0)]
        [String]$Identity
    )#End: Param
    try 
    {
        #[byte[]]$test = @(0)* 2940
        $thumbnailphoto = (Get-AdUser -Identity $Identity -Properties thumbnailphoto).thumbnailphoto
        if([string]::IsNullOrWhiteSpace($thumbnailphoto) -eq $false)
        {
            $Img = [Convert]::ToBase64String((Get-AdUser -Identity $Identity -Properties thumbnailphoto).thumbnailphoto)
            $bitmap = New-Object System.Windows.Media.Imaging.BitmapImage
            $bitmap.BeginInit()
            $bitmap.StreamSource = [System.IO.MemoryStream][System.Convert]::FromBase64String($Img)
            $bitmap.EndInit()
            # Freeze() prevents memory leaks.
            $bitmap.Freeze()
        }
        else 
        {
            $bitmap = "C:\ProgramData\Microsoft\User Account Pictures\guest.png"     
        }
    }
    catch 
    {
    }
    return $bitmap
}

function SimplePassword
{
    $words = "Adresse", "Service", "Fibre", "Optique", "Internet", "Mouse", "Computer", "Desktop", "Inovation", "Web", "Expert", "Souris", "Bouton", "Bureau", "Courrier", "Page","Usb","Explorer", "Code", "Error", "Virus", "Codex", "Area", "Cpu", "Board", "Word", "Excel", "Access"   
    $string = (Get-Culture).TextInfo.ToTitleCase((Get-Random -InputObject $words)) + (Get-Culture).TextInfo.ToTitleCase((Get-Random -InputObject $words)) + (Get-Random -Minimum 10 -Maximum 99 )
    $password = $string
    Return $password
}
Function Test-CommandExists
{
<#
.SYNOPSIS
    Test if a command is available in powershell.

.DESCRIPTION
    Allow to test if a command is fonctional in powershell before using it.

.PARAMETER command
    The command that you want to test.

.EXAMPLE
    Test-CommandExists -command Get-AdUser

#>
 Param ($command)

 $oldPreference = $ErrorActionPreference

 $ErrorActionPreference = ‘stop’

 try {if(Get-Command $command){RETURN $true}}

 Catch 
 {
    #Write-Host “$command does not exist”; 
    RETURN $false
}

 Finally {$ErrorActionPreference=$oldPreference}

} #end function test-CommandExists

function searchADUser
{
    param 
    (
        [Parameter(Mandatory=$True, 
		Position=0)]  
		[string]$TexttoSearh,

		[Parameter(Mandatory=$True, 
		Position=1)]  
		[array]$OutGridViewColumns,

        [Parameter(Mandatory=$True, 
		Position=2)]  
        [String]$OutGridViewTitle
    )
    $ReturnUserInfos=@{}
    try 
    {
        #Search the user Identity in the AD with the Current entered Text.
        if(![string]::IsNullOrEmpty($TexttoSearh))# If the Text is not empty or null
        {
            $TexttoSearh = $TexttoSearh+"*" #Add * at the end of the string (I hope that no one will use * in a search :S)
            $OutGridViewColumns = $OutGridViewColumns | Where-Object {$_ -is [string]} #Keep only the string from the array to remove potential errors (not sure if necessary)
            #Use the current entered text to filter the Get-ADUser command for the displayName, SamAccountName, Name and UserPrincipalName.
            #Use the -Properties with the $Search_OutGridView_Columns_AttributesList variable.
            $SelectedUser = Get-ADUser -Filter {(Surname -like $TexttoSearh) -or (GivenName -like $TexttoSearh) -or (displayName -like $TexttoSearh) -or (SamAccountName -like $TexttoSearh) -or (Name -like $TexttoSearh)-or (UserPrincipalName -like $TexttoSearh)} -Properties $OutGridViewColumns | Select-Object $OutGridViewColumns | Out-GridView -Title $OutGridViewTitle -OutputMode Single
            #Show and Out-gridview to allow the user to select the user retrieve by the Get-AdUser filter.
            #$SelectedUser = $SelectedUser | Out-GridView -Title $OutGridViewTitle -OutputMode Single
            
            $ReturnUserInfos=@{
                "DistinguishedName" = (Get-ADUser -Identity $SelectedUser.SamAccountName -Properties DistinguishedName).DistinguishedName ;
                "objectGUID" = (Get-ADUser -Identity $SelectedUser.SamAccountName -Properties objectGUID).objectGUID ;
                "SID" = (Get-ADUser -Identity $SelectedUser.SamAccountName -Properties DistinguishedName).SID ;
                "sAMAccountName" = (Get-ADUser -Identity $SelectedUser.SamAccountName -Properties DistinguishedName).sAMAccountName
            }
        }
    }
    catch 
    {
    }
    if([string]::IsNullOrEmpty($TexttoSearh))
    {
        $ReturnUserInfos=@{}
    }
    return $ReturnUserInfos
}

#==============================================================================
#=       __  ___    __        __             ==================================
#=  /\  /  `  |  | /  \ |\ | /__`            ==================================
#= /~~\ \__,  |  | \__/ | \| .__/            ==================================
#=                                           ==================================
#==============================================================================
#For functions that have one use only

#http://patorjk.com/software/taag/#p=display&f=JS%20Stick%20Letters&t=Functions
#==============================================================================

function ActivateForm 
{
    $WPFGP_Informations.IsEnabled = $True
    $WPFGP_Password.IsEnabled = $True
    $WpFGP_Lock.IsEnabled = $True    
}

function ChangeLockLabelFromCurrentUserStatus 
{
    param 
    (
        [Parameter(Mandatory=$True, 
		Position=0)]  
		[string]$Identity
    )
    try 
    {
        if([string]::IsNullOrEmpty($Identity) -eq $false)
        {
         $Status = (Get-ADUser -Identity $Identity -Properties LockedOut).LockedOut    
        }
        else 
        {
            $Status = $null
        }
    }
    catch 
    {    
    }
	if ($Status) 
	{
        $LabelObject=@{
            "String" = "Ï" #Interogation point=s #Close lock=Ï #Open lock=Ð
            "Color" = "Red"
        } 
	}
	elseif (!$Status) 
	{
        $LabelObject=@{
            "String" = "Ð" #Interogation point=s #Close lock=Ï #Open lock=Ð
            "Color" = "Green"
        } 
	}
	else
	{
        $LabelObject=@{
            "String" = "s" #Interogation point=s #Close lock=Ï #Open lock=Ð
            "Color" = "Black"
        } 
    } 
    
    $WPFGP_Lock_Label.Foreground = $LabelObject.Color
    $WPFGP_Lock_Label.Content = $LabelObject.String
}

function EventChangePassword
{
    $TabIndex = $WPFTabPassword.SelectedIndex
    #Write-Host "The Tab Index is "$TabIndex
    #If the Modify tab is selected
    if ($TabIndex -eq 0)
    {
        #Write-Host "Inside Modify"
        $CurrentNewPassword = $WPFGP_Password_NewPassword_TextBox.Password
        $CurrentConfirmNewPassword = $WPFGP_Password_ConfirmNewPassword_TextBox.Password
        $CurrentSecureNewPassword = $WPFGP_Password_NewPassword_TextBox.SecurePassword
        #Write-Host "Password=" $CurrentConfirmNewPassword "and " $CurrentConfirmNewPassword
        #Write-Host "Secure=" $CurrentSecureNewPassword
        #write-host "Plain=" ($CurrentSecureNewPassword | ConvertFrom-SecureString)
        # If both password textbox are not null or empty
        # And if both textbox are equal
        # And if the lenght is greater or equal to the MinPasswordLenght Policy.
        if((([string]::IsNullOrEmpty($CurrentNewPassword) -eq $false) -and ([string]::IsNullOrEmpty($CurrentConfirmNewPassword) -eq $false)) -and ($CurrentNewPassword -eq $CurrentConfirmNewPassword) -and ($CurrentNewPassword.length -ge $global:MinPasswordLength))
        {
            #Write-Host "PasswordComplexityEnabled="$global:PasswordComplexityEnabled
            If($global:PasswordComplexityEnabled)
            {
                #Verify if the current password meet the password complexity
                #Uppercase characters (A, B, C, D, E, ...)
                #Lowercase characters (a, b, c, d, e, ...)
                #Numerals (0, 1, 2, 3, ...)
                #Special characters (#, $, *, %, ...)
                if(($CurrentNewPassword -cmatch '[a-z]') -and ($CurrentNewPassword -cmatch '[A-Z]') -and ($CurrentNewPassword -match '\d') -and ($CurrentNewPassword -match '!|@|#|%|^|&|$'))
                {
                    #try to change the password
                    try 
                    {  
                        #Confirm if we realy want to change the password.
                        $ChangePasswordAnswer = GenerateWarningForm -MessageboxTitle "Do you want to change the password ?" -Messageboxbody ("Do you want to change the password of "+$global:Current_User_Identities.sAMAccountName+"?") -ButtonType "YesNo" -MessageIcon "Question"
                        #Write-Host "The answer is $ChangePasswordAnswer"
                        if ($ChangePasswordAnswer -eq "Yes") #1 =Yes 0=No
                        {
                            #Write-Host "Doing The Yes"
                            #Get the status of the Change Password at logon checkbox.
                            $ChangePasswordLogonCheckboxStatus = $WPFGP_Password_Checkbox.IsChecked
                            #Write-Host "The Change Checkbox Status is $ChangePasswordLogonCheckboxStatus"
                            if($ChangePasswordLogonCheckboxStatus) #Change the password and force the user to change it at it next logon.
                            {
                                ChangeUserPassword -Identity $global:Current_User_Identities.sAMAccountName -Password $CurrentSecureNewPassword -ChangePasswordAtLogon
                                #Generate a message confirming the password change and flag for the password change at next logon.
                                GenerateWarningForm -MessageboxTitle "Password changed successfully" -Messageboxbody ("The password has now been changed for " + $global:Current_User_Identities.sAMAccountName + "`r`r***The user must change his password at logon.***") -MessageIcon "Information"  -ButtonType "OK" 
                            }
                            else #Change the password only
                            {
                                    ChangeUserPassword -Identity $global:Current_User_Identities.sAMAccountName -Password $CurrentSecureNewPassword
                                    GenerateWarningForm -MessageboxTitle "Password changed successfully" -Messageboxbody ("The password has now been changed for "+$global:Current_User_Identities.sAMAccountName)  -MessageIcon "Information"  -ButtonType "OK" 
                            }
                        }
                    }
                    catch 
                    {
                        GenerateWarningForm -Messageboxbody $_.Exception.Message -ButtonType "OK" -MessageIcon "Error" -MessageboxTitle "ERROR: Cannot Change the Password!"
                    }
                    finally
                    {
                        $WPFGP_Password_NewPassword_TextBox.Password = ""
                        $WPFGP_Password_ConfirmNewPassword_TextBox.Password = ""
                        $WPFGP_Password_NewPassword_TextBox.Clear()
                        $WPFGP_Password_ConfirmNewPassword_TextBox.Clear()
                    }
                }
                #Does not meet the Password complexity
                else 
                {
                    $PasswordErrorMessage = @"
*** The current password doesn't meet the following : ***
    ►Uppercase characters (A, B, C, D, E, ...)
    ►Lowercase characters (a, b, c, d, e, ...)
    ►Numerals (0, 1, 2, 3, ...)
    ►Special characters (#, $, *, %, ...)
"@
                                GenerateWarningForm -MessageboxTitle "The Password is not Complex Enough" -Messageboxbody $PasswordErrorMessage -ButtonType "OK" -MessageIcon "Exclamation"
                }
            }
            #No Password Complexity
            else 
            {
                #try to change the password
                try 
                {  
                    #Confirm if we realy want to change the password.
                    $ChangePasswordAnswer = GenerateWarningForm -MessageboxTitle "Do you want to change the password ?" -Messageboxbody ("Do you want to change the password of "+$global:Current_User_Identities.sAMAccountName+"?") -ButtonType "YesNo" -MessageIcon "Question"
                    #Write-Host "The answer is $ChangePasswordAnswer"
                    if ($ChangePasswordAnswer -eq "Yes") #1 =Yes 0=No
                    {
                        #Write-Host "Doing The Yes"
                        #Get the status of the Change Password at logon checkbox.
                        $ChangePasswordLogonCheckboxStatus = $WPFGP_Password_Checkbox.IsChecked
                        #Write-Host "The Change Checkbox Status is $ChangePasswordLogonCheckboxStatus"
                        if($ChangePasswordLogonCheckboxStatus) #Change the password and force the user to change it at it next logon.
                        {
                            ChangeUserPassword -Identity $global:Current_User_Identities.sAMAccountName -Password $CurrentSecureNewPassword -ChangePasswordAtLogon
                            #Generate a message confirming the password change and flag for the password change at next logon.
                            GenerateWarningForm -MessageboxTitle "Password changed successfully" -Messageboxbody ("The password has now been changed for " + $global:Current_User_Identities.sAMAccountName + "`r`r***The user must change his password at logon.***") -MessageIcon "Information"  -ButtonType "OK" 
                        }
                        else #Change the password only
                        {
                            ChangeUserPassword -Identity $global:Current_User_Identities.sAMAccountName -Password $CurrentSecureNewPassword
                            GenerateWarningForm -MessageboxTitle "Password changed successfully" -Messageboxbody ("The password has now been changed for " + $global:Current_User_Identities.sAMAccountName) -MessageIcon "Information"  -ButtonType "OK" 
                        }
                    }
                }
                catch 
                {
                    GenerateWarningForm -Messageboxbody $_.Exception.Message -ButtonType "OK" -MessageIcon "Error" -MessageboxTitle "ERROR: Cannot Change the Password!"
                }
                finally
                {
                    $WPFGP_Password_NewPassword_TextBox.Password = ""
                    $WPFGP_Password_ConfirmNewPassword_TextBox.Password = ""
                    $WPFGP_Password_NewPassword_TextBox.Clear()
                    $WPFGP_Password_ConfirmNewPassword_TextBox.Clear()
                }
            }
        }
        else 
        {
            $PasswordErrorMessage = @"
*** The current password doesn't met the following: ***
    ► The password can't be empty.
    ► The minimum length is $global:MinPasswordLength characters.
    ► Both entered passwords must be the same.
"@
            GenerateWarningForm -MessageboxTitle "The Password is not Complex Enough" -Messageboxbody $PasswordErrorMessage -ButtonType "OK" -MessageIcon "Exclamation"
        }
    }
    #If the Randomise tab is selected
    if ($TabIndex -eq 1) 
    {
        #Write-Host "Inside Randomise"
        $CurrentRandomisePassword = $WPFGP_Password_Randomise_TextBox.Text
        $CurrentSecureRandomisePassword = ConvertTo-SecureString $CurrentRandomisePassword –asplaintext –force
        if([string]::IsNullOrEmpty($CurrentRandomisePassword) -eq $false)# If the randomise password is not empty.
        {
            if ($CurrentRandomisePassword.Length -ge $global:MinPasswordLength)
            {
                try 
                {  
                    $ChangePasswordAnswer = GenerateWarningForm -MessageboxTitle "Do you want to change the password ?" -Messageboxbody ("Do you want to change the password of "+$global:Current_User_Identities.sAMAccountName+"?") -ButtonType "YesNo" -MessageIcon "Question"
                    if ($ChangePasswordAnswer -eq "Yes") #1 =Yes 0=No
                    {
                        #Get the status of the Change Password at logon checkbox.
                        $ChangePasswordLogonCheckboxStatus = $WPFGP_Password_Checkbox.IsChecked
                        #Write-Host $ChangePasswordLogonCheckboxStatus
                        if($ChangePasswordLogonCheckboxStatus) #Change the password and force the user to change it at it next logon.
                        {
                            ChangeUserPassword -Identity $global:Current_User_Identities.sAMAccountName -Password $CurrentSecureRandomisePassword -ChangePasswordAtLogon
                            #Generate a message confirming the password change and flag for the password change at next logon.
                            GenerateWarningForm -MessageboxTitle "Password changed successfully" -Messageboxbody ("The password has now been changed for " + $global:Current_User_Identities.sAMAccountName + "`r`r***The user must change his password at logon.***") -MessageIcon "Information"  -ButtonType "OK" 
                        }
                        if ($ChangePasswordLogonCheckboxStatus -eq $false) #Change the password only
                        {
                            ChangeUserPassword -Identity $global:Current_User_Identities.sAMAccountName -Password $CurrentSecureRandomisePassword
                            GenerateWarningForm -MessageboxTitle "Password changed successfully" -Messageboxbody ("The password has now been changed for " + $global:Current_User_Identities.sAMAccountName) -MessageIcon "Information"  -ButtonType "OK" 
                        }
                    }
                }
                catch 
                {
                    GenerateWarningForm -Messageboxbody $_.Exception.Message -ButtonType "OK" -MessageIcon "Error" -MessageboxTitle "ERROR: Cannot Change the Password!"
                }
                finally
                {
                    $WPFGP_Password_NewPassword_TextBox.Password = ""
                    $WPFGP_Password_ConfirmNewPassword_TextBox.Password = ""
                    $WPFGP_Password_NewPassword_TextBox.Clear()
                    $WPFGP_Password_ConfirmNewPassword_TextBox.Clear()
                }  
            }
            else 
            {
                $WPFGP_Password_NewPassword_TextBox.Password = ""
                $WPFGP_Password_ConfirmNewPassword_TextBox.Password = ""
                $WPFGP_Password_NewPassword_TextBox.Clear()
                $WPFGP_Password_ConfirmNewPassword_TextBox.Clear()
                GenerateWarningForm -MessageboxTitle "ERROR: Password too short" -Messageboxbody "The minimum length is $global:MinPasswordLength characters." -ButtonType "OK" -MessageIcon "Hand"        
            }  
        }
    }
}

function ClearForm 
{
    #Main_Form
    $WPFMain_Picture.Source = "C:\ProgramData\Microsoft\User Account Pictures\guest.png"
    $WPFMain_Label.Content = "Unknown"
    #GP_Informations
    $WPFGP_Informations_DataGrid.Items.Clear()
    $WPFGP_Informations.IsEnabled =$false
    #GP_Password
    $WPFGP_Password.IsEnabled = $false
    $WPFGP_Password_NewPassword_TextBox.Password = ""
    $WPFGP_Password_ConfirmNewPassword_TextBox.Password = ""
    $WPFGP_Password_NewPassword_TextBox.Clear()
    $WPFGP_Password_ConfirmNewPassword_TextBox.Clear()
    $WPFGP_Password_Checkbox.IsChecked = $false
    #GP_Lock
    $WPFGP_Lock_DataGrid.Items.Clear()
    $WPFGP_Lock.IsEnabled = $false
    $WPFGP_Lock_Label.Content = "s"
    $WPFGP_Lock_Label.Foreground = "Black"
    #GP_Search
    #$WPFGP_Search_TextBox.Text = "Search user here"
}
function PopulateDataGridInformation #Populate the Form with the current selected User.
{
    param 
    (
        [Parameter(Mandatory=$True, 
		Position=0)]  
		[string]$Identity,

		[Parameter(Mandatory=$True, 
		Position=1)]  
        [array]$AttributesList
    )
    try 
    {
        $WPFGP_Informations_DataGrid.items.Clear()
        #Write-Host $AttributesList
        if(![string]::IsNullOrEmpty($Identity)) 
        {
            foreach ($Attribute in $AttributesList) 
            {
                    $Value=(Get-ADUser -Identity $Identity -Properties *).$Attribute
                    #Write-Host "Attribute is :"+$Attribute
                    if($null -ne $Value)# If the Text is not empty or null
                    {
                        if ($Attribute -eq "Manager") 
                        {
                            $Value=$Value.TrimStart("CN=")
                            $Value=$Value.split(',')[0]
                        }
                    }
                #Add Information into the datagrid Column bind to Attributes et Values
                $WPFGP_Informations_DataGrid.AddChild([pscustomobject]@{Attributes=($Attribute+":");Values=$Value})
            }
        }
    }    
    catch 
    {
    }
}

function PopulateDataGridLock #Populate the Form with the current selected User.
{
    param 
    (
        [Parameter(Mandatory=$True, 
		Position=0)]  
		[string]$Identity

    )
    try 
    {
        if([string]::IsNullOrEmpty($Identity) -eq $false)
        {
            #$WPFGP_Lock_DataGrid.items.Clear()
            $CurrentTime=Get-Date -Format G
            $Status = (Get-ADUser -Identity $Identity -Properties LockedOut).LockedOut

            $CurrentItemsNumber = $WPFGP_Lock_DataGrid.items.Count
            #$WPFGP_Lock_DataGrid.items.Clear()
            $WPFGP_Lock_DataGrid.AddChild([pscustomobject]@{Time=($CurrentTime+":");User=$Identity;Status=$Status})
            $WPFGP_Lock_DataGrid.ScrollIntoView($WPFGP_Lock_DataGrid.items[$CurrentItemsNumber])
        }
    }
    catch 
    {
    }
}
#Things that happen when the user press the search button of the enter key into the TextBox.
function SearchEvent
{
    ClearForm #Clear the form before Searching
    $Stop=$true #Will be use to validate if any error occurs into the try. Will be change to $false if no error occur.
    if(![string]::IsNullOrEmpty($WPFGP_Search_TextBox.Text))
    {
        try 
        {
            #Get the Identities of the Current user to use and make it available for other function into the script.
            $global:Current_User_Identities = searchADUser -TexttoSearh $WPFGP_Search_TextBox.Text -OutGridViewTitle $Search_OutGridView_Title -OutGridViewColumns $Search_OutGridView_Columns_AttributesList
            #Set the Main Label to the $Main_Label_Text_Shown variable.
            $Stop=$false # No error encounter set to $False
        }
        catch 
        {        
        }
    }
    if(!$Stop)
    {
        try 
        {
            $WPFMain_Label.content = (Get-ADUser -Identity $global:Current_User_Identities.sAMAccountName -Properties $Main_Label_Text_Shown).$Main_Label_Text_Shown
            ActivateForm
            PopulateDataGridInformation -Identity $global:Current_User_Identities.sAMAccountName -AttributesList $Informations_DataGrid_AttributesList
            PopulateDataGridLock -Identity $global:Current_User_Identities.sAMAccountName
            ChangeLockLabelFromCurrentUserStatus -Identity $global:Current_User_Identities.sAMAccountName
            $WPFMain_Picture.Source = GetAdUserPhoto -Identity $global:Current_User_Identities.sAMAccountName
            $WPFGP_Password_Randomise_TextBox.Text = SimplePassword
        }
        catch 
        {    
        }
    }
    else 
    {
        $global:Current_User_Identities = $null
        ClearForm
    }

}

function StartupVerification 
{
<#
.SYNOPSIS
    Make Verification at the Start up of the script.

.DESCRIPTION
    A simple function to verify that everything is available for the script before showing a form.
.EXAMPLE
    StartupVerification

#>
$RSATMessageBoxTitle=@"
RSAT is missing from the Features on Demand
"@

$RSATMessageboxbody=@"
*** A IMPORTANT COMPONENT FOR THIS SOFTWARE IS MISSING ***
RSAT: Active Directory Domain Services and Lightweight Directory Services Tools:
RSAT lets IT admins manage Windows Server roles and features from a Windows 10 PC.

WOULD YOU LIKE TO INSTALL RSAT NOW? 
Optional Features ► Add a feature ► RSAT: Active Directory Domain Services and Lightweight Directory Services Tools`n
*In other case, the program will terminate.*
"@

    if(Test-CommandExists Get-AdUser) #Verify that Get-AdUser is working.
    {
        $RSATResult=$true # If it return true, it mean that the Rsat module is install anbd that Get-AdUser can be use.
        $Form.ShowDialog() | out-null #Show the Form that need Get-AdUser to work.
    }
    else 
    {
        $RSATResult=$false

        $RSATAnswer=GenerateWarningForm -MessageboxTitle $RSATMessageBoxTitle -Messageboxbody $RSATMessageboxbody -ButtonType "YesNo" -MessageIcon "Question" #The necesary module is not install. Popup a message to allow the user to install it.
        if ("Yes" -eq $RSATAnswer) 
        {
            Start-Process "ms-settings:appsfeatures-app" #Open Apps and Features where the user can install it.
        }
    }
}

#==============================================================================
#=  ___       ___      ___  __               ==================================
#= |__  \  / |__  |\ |  |  /__`              ==================================
#= |___  \/  |___ | \|  |  .__/              ================================== 
#=                                           ==================================
#==============================================================================
#For events from the GUI

#http://patorjk.com/software/taag/#p=display&f=JS%20Stick%20Letters&t=Functions
#==============================================================================


###################
# GP_Informations #
###################

$WPFGP_Informations_Button.Add_Click(
    {
        $WPFGP_Informations_DataGrid.Items.Clear()
        PopulateDataGridInformation -AttributesList $Informations_DataGrid_AttributesList -Identity $global:Current_User_Identities.sAMAccountName
        #ChangeLockLabelFromCurrentUserStatus -Identity $global:Current_User_Identities.sAMAccountName
        #PopulateDataGridLock -Identity $global:Current_User_Identities.sAMAccountName
        ChangeLockLabelFromCurrentUserStatus -Identity $global:Current_User_Identities.sAMAccountName
    }
)

###########
# GP_Lock #
###########

$WPFGP_Status_Button_Verify.Add_Click(
    {
        ChangeLockLabelFromCurrentUserStatus -Identity $global:Current_User_Identities.sAMAccountName
        PopulateDataGridLock -Identity $global:Current_User_Identities.sAMAccountName
    }
)

$WPFGP_Status_Button_Unlock.Add_Click(
    {
        Unlock-ADAccount -Identity $global:Current_User_Identities.sAMAccountName
        ChangeLockLabelFromCurrentUserStatus -Identity $global:Current_User_Identities.sAMAccountName
        PopulateDataGridLock -Identity $global:Current_User_Identities.sAMAccountName
    }
)


###############
# GP_Password #
###############
#Generate random password into the $WPFGP_Password_Randomise_TextBox
$WPFGP_Password_Button_Randomise.Add_Click(
    {
        $WPFGP_Password_Randomise_TextBox.Text = SimplePassword
    }
)
#Generate random password into the $WPFGP_Password_Randomise_TextBox
$WPFGP_Password_Button.Add_Click(
    {
        EventChangePassword
        ChangeLockLabelFromCurrentUserStatus -Identity $global:Current_User_Identities.sAMAccountName
    }
)

#############
# GP_Search #
#############
#Generate an action when the Enter key is press into the Gp_Search.
$WPFGP_Search_TextBox.Add_KeyDown(
{
    if ($args[1].key -eq 'Enter')
    { 
        SearchEvent
        $WPFGP_Search_TextBox.Text = "Search user here"
    }
})
#Generate an action when the Search_Button is press into the Gp_Search.
$WPFGP_Search_Button_Search.Add_Click(
    {
        SearchEvent
        $WPFGP_Search_TextBox.Text = "Search user here"
    }
)
#Clear the form from the current user.
$WPFGP_Search_Button_Clear.Add_Click(
    {
        ClearForm
        $WPFGP_Search_TextBox.Text = "Search user here"
    }
)

#===========================================================================
# Shows the form
#===========================================================================
#write-host "To show the form, run the following" -ForegroundColor Cyan
#'$Form.ShowDialog() | out-null'

StartupVerification