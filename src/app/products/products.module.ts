import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProductsRoutingModule } from './products-routing.module';
import { IndexComponent } from './index/index.component';
import { BrowserAnimationsModule } from  '@angular/platform-browser/animations';
import { MatPaginatorModule } from  '@angular/material/paginator';
import { MatTableModule } from  '@angular/material/table';
import { MatSortModule } from '@angular/material/sort';
import { CreateComponent } from "./create/create.component";
import { FormsModule } from '@angular/forms';
import {CloudinaryModule} from '@cloudinary/ng';
import { FilePondModule, registerPlugin } from 'ngx-filepond';

// import and register filepond file type validation plugin
import  * as FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type';
import  * as FilepondPluginImageEdit from 'filepond-plugin-image-edit';
import  * as FilepondPluginImagePreview from 'filepond-plugin-image-preview';
import { EditComponent } from './edit/edit.component';
import { ViewComponent } from './view/view.component';
registerPlugin(FilePondPluginFileValidateType,FilepondPluginImageEdit,FilepondPluginImagePreview);

@NgModule({
    declarations: [
        IndexComponent,
        CreateComponent,
        EditComponent,
        ViewComponent
    ],
    imports: [
        CommonModule,
        ProductsRoutingModule,
        MatTableModule,
        MatPaginatorModule,
        BrowserAnimationsModule,
        MatSortModule,
        FormsModule,
        CloudinaryModule,
        FilePondModule,
        
    ]
})
export class ProductsModule { }
