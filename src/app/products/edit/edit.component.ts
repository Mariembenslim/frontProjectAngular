import { Component, ElementRef, Input, OnInit, ViewChild } from '@angular/core';
import { FilePondComponent } from 'ngx-filepond';
import { Products } from '../products';
import { ProductsService } from '../products.service';
import { FilePondOptions } from 'filepond';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrl: './edit.component.css'
})
export class EditComponent implements OnInit  {
  @Input() productId: object;

  @ViewChild('myModal') myModal!: ElementRef;

  @ViewChild('myPond') myPond: FilePondComponent;

  display = "none";

  products:Products=new Products();


  constructor(private prodserv:ProductsService){}
  ngOnInit(){
   this.prodserv.find(this.productId).subscribe(data => {
    this.products = data;
    this.updatePondFiles(); 
  });
  }


 
  updatearticle=()=>{
     this.prodserv.update(this.products.id,this.products).subscribe((data=>{
      console.log(data)
      this.closeModal() 
      window.location.reload();
  }))
    
  }
  

  openModal() { 
       this.display = "block";
  }
 
  closeModal() {
    this.display = "none";
  }

  pondFiles: FilePondOptions["files"]

  updatePondFiles() {
   this.pondFiles = [
      {
        source: this.products.image,
        options: {
          type: 'local'
        },
      },
    ];
  }
 
  
  pondOptions = {
    class: 'my-filepond',
    multiple: false,
    labelIdle: 'Drop files here',
    acceptedFileTypes: 'image/jpeg, image/png',
    server: {
        load: (source:any, load:any, error:any, progress:any, abort:any, headers:any) => {
           if (typeof source === 'string' && source !== '') {
                var myRequest = new Request(source);
              fetch(myRequest).then(function(response) {
                response.blob().then(function(myBlob) {
                  load(myBlob);
                });
              });
       }
        else {
          error('Invalid URL');
        }
      },

      process: (fieldName:any, file:any, metadata:any, load:any, error:any, progress:any, abort:any) => {
      
        const data=new FormData();
      
        data.append('file', file);
        data.append('upload_preset', 'Ecommerce_cloudinary');
        data.append('cloud_name', 'iset-sfax')
        data.append('public_id', file.name)
    
        this.prodserv
        .uploadSignature(data)
        .subscribe({
          next: (res) => {
           this.products.image = res.url;
           load(res);
          },
          error: (e) => {
            console.log(e);
            error(e);
            return () => {
              abort();
            };
          },
          complete: () => {
          console.log('done');
          return () => {
            abort();
          };
           }
           
        })
        
        },
        revert: (uniqueFileId:any, load:any, error:any) => {
                error('Error');
                load();
      },
 
    }
  }

}
